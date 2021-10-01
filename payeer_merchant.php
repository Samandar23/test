<?php
# Автоподгрузка классов
function __autoload($name){ include("classes/_class.".$name.".php");}

# Класс конфига 
$config = new config;

# Функции
$func = new func;

# База данных
$db = new db($config->HostDB, $config->UserDB, $config->PassDB, $config->BaseDB);


if (isset($_POST["m_operation_id"]) && isset($_POST["m_sign"]))
{
	$m_key = "k7pnuNy4VhkIosuk";
	$arHash = array($_POST['m_operation_id'],
			$_POST['m_operation_ps'],
			$_POST['m_operation_date'],
			$_POST['m_operation_pay_date'],
			$_POST['m_shop'],
			$_POST['m_orderid'],
			$_POST['m_amount'],
			$_POST['m_curr'],
			$_POST['m_desc'],
			$_POST['m_status'],
			$m_key);
	$sign_hash = strtoupper(hash('sha256', implode(":", $arHash)));
	if ($_POST["m_sign"] == $sign_hash && $_POST['m_status'] == "success")
	{
	$id_oper = intval($_POST['m_orderid']);
	$db->Query("SELECT * FROM db_insert_payeer WHERE id = '$id_oper'");
	$row = $db->FetchArray();
	$sum = $row['summa'];
	$uss_id = $row['user_id'];
	$db->Query("UPDATE db_users SET money_in = money_in + '$sum' WHERE id = '$uss_id'");
	$db->Query("UPDATE db_insert_payeer SET status = 1 WHERE id = '$id_oper'");
	$db->Query("UPDATE db_stats SET popol = popol + '$sum' WHERE id = 1");
		
		echo $_POST['m_orderid']."|success"; 
		exit;
	}
	echo $_POST['m_orderid']."|error";
}



?>