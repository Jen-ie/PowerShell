#Loops
#for (<Init>; <Condition>; <Repeat>)
#{
#   <Statement list>
#}

for ($counter = 0; $counter -lt 10; $counter++) 
{ 
    $counter 
}

#ForEach
$MyArray = "J", "e", "n" 
foreach ($Letter in $MyArray) 
{ 
    $Letter 
}

#While
#while($val -ne 3) 
#{ 
#    $val++ Write-Host $val
#}

#Do/Until
$a = 0 
do 
{ 
    “Starting Loop $a” 
    $a 
    $a++ 
    “Now `$a is $a” 
} until ($a -ge 5)