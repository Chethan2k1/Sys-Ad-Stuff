<?php	

	function Ck_cmped($conn)
	{
		$time=time();
		$query_run=mysqli_query($conn,"SELECT * FROM req;");
		while ($query_row=mysqli_fetch_assoc($query_run)) 
		{
			$ID=$query_row['ID'];
			$Time=$query_row['time_started'];
			$result1=mysqli_query($conn,"SELECT * FROM Requests WHERE ID=$ID;");
			$result=mysqli_fetch_assoc($result1);
			$comp_time_req=$result['comp_time_req'];
			$Time+=$comp_time_req;
			$node=$result['allocated_node_name'];
			$CPU_Req=$result['CPU_Req'];
			$Mem_Req=$result['Memory_Req'];
			if($time>$Time)
			{
				mysqli_query($conn,"DELETE FROM req WHERE ID=$ID;");
				mysqli_query($conn,"DELETE FROM Requests WHERE ID=$ID;");
				mysqli_query($conn,"UPDATE nodes SET CPUS=CPUS+$CPU_Req,Mem_Aval=Mem_Aval+$Mem_Req WHERE name=$node;");
			 	switch ($node) 
			 	{
                    case '80':
                            mysqli_query($conn,"INSERT INTO history1 (ID) VALUES('$ID');") or die("Fuck off") ;
                        break;
                    case '81':
                            mysqli_query($conn,"INSERT INTO history2 (ID) VALUES('$ID');");
                        break;
                    case '82':
                            mysqli_query($conn,"INSERT INTO history3 (ID) VALUES('$ID');");
                        break;
                    case '83':
                            mysqli_query($conn,"INSERT INTO history4 (ID) VALUES('$ID');");
                        break;
                }
            }
		}
	}

	$CPUs=$_POST['CPUs'];
	$Mem_Need=$_POST['Mem_Need'];
	$Time=$_POST['Time'];
	echo "Succesfully submitted";
	$conn=mysqli_connect('localhost','root','Pass123','ser_det') or die("SQL_Database Connection Unsuccesful!");
	Ck_cmped($conn);
	$query_run=mysqli_query($conn,"SELECT * FROM nodes WHERE CPUs > $CPUs and Mem_Aval > $Mem_Need ORDER BY CPUs DESC;") or die("Couldn't run the query");
	echo "<br>";
	if($query_row=mysqli_fetch_assoc($query_run))
	{
		$node_name=$query_row['name'];
        $time=time();
        $time_stamp=date('h:m:s');
        echo($time_stamp."<br>");
        $stmt=$conn->prepare("INSERT INTO Requests (allocated_node_name,Starttime,CPU_Req,Memory_Req,comp_time_req) VALUES(?,?,?,?,?);") or die('why');
        $stmt->bind_param('sssss',$node_name,$time_stamp,$CPUs,$Mem_Need,$Time) or die('fail1');
        $result=$stmt->execute() or die('fail_too');
        echo $result;
        $stmt->close();
        $query_run1=mysqli_query($conn,"SELECT * FROM Requests ORDER BY ID DESC;");
        $query_row1=mysqli_fetch_assoc($query_run1);
        $ID=$query_row1['ID'];
        mysqli_query($conn,"UPDATE nodes SET CPUs=CPUs-$CPUs,Mem_Aval=Mem_Aval-$Mem_Need WHERE name=$node_name");
        mysqli_query($conn,"INSERT INTO req VALUES($ID,$time,$node_name)") or die("Not happening");
	}
	else
	{
		echo("Can't Handle the Request in this moment");
	}
?>
