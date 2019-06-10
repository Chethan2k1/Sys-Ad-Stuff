<?php
    function check_req()
    {
        $query_id=mysql_query("select * from req");
        while ($row=mysql_fetch_assoc($query_id)) {
            $id=$row['ID'];
            $time_need=$row['time_started'];
            $node=$row['node_name'];
            $query_id1=mysql_query("select * from Requests wherer ID=$id");
            $row1=mysql_fetch_assoc($query_id1);
            $time_need0=$row1['comp_time_req'];
            $time_need1=$time_need;
            $time_need=$time_need+$time_need0;
            if ($time_need<time()) {
                mysql_query('delete from req where ID=$id');
                mysql_query('delete from Requests where ID=$id');
                echo "Deleted Request ID : ".$id;
                switch ($node) {
                    case '80':
                            mysql_query("insert into history1 values('$id','date('h:m:s,$time_need1')','date('h:m:s,$time_need)')");
                        break;
                    case '81':
                            mysql_query("insert into history2 values('$id','date('h:m:s,$time_need1')','date('h:m:s,$time_need)')");
                        break;
                    case '82':
                            mysql_query("insert into history3 values('$id','date('h:m:s,$time_need1')','date('h:m:s,$time_need)')");
                        break;
                    case '83':
                            mysql_query("insert into history4 values('$id','date('h:m:s,$time_need1')','date('h:m:s,$time_need)')");
                        break;
                }
            }
        }
    }
    echo "Succesfully submitted ";
    $CPUs=$_POST['CPUs'];
    $Rq_Mem=$_POST['Mem_Need'];
    $Rq_Time=$_POST['Time'];
    echo $CPUs." : ".$Rq_Mem." : ".$Rq_Time;
    mysql_connect("localhost","root","Pass123") or die("Couldn't Connect to the SQL Server");
    mysql_select_db('ser_det');
    check_req();
    $query_run=mysql_query("select * from nodes where CPUs > $CPUs and Mem_Aval > $Rq_Mem order by CPUs Desc") or die("Couldn't run the query");
    echo "<br>";
    if($query_row=mysql_fetch_assoc($query_run))
    {
        print_r($query_row);
        echo "<br>";
        $node_name=$query_row['name'];
        $time=time();
        $time_stamp=date('h:m:s,$time');
        $query_num=mysql_query("select * from Requests order by ID Desc");
        $max_id_row=mysql_fetch_assoc($query_num);
        $ID=$max_id_row['ID'];
        mysql_query("insert into Requests(allocated_node_name,Starttime,CPU_Req,Memory_Req,comp_time_req) values('$node_name','$time_stamp','$CPUs','$Rq_Mem','Rq_Time'"); 
        mysql_query("update nodes set CPUs=CPUs-$CPUs,Mem_Aval=Mem_Aval-$Rq_Mem where name=$node_name");
        mysql_query("insert into req values($ID,$time,$node_name)");

    }
    else
    {
        Die("Can't Handle the Request in this moment");
    }
?>