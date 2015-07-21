---
layout: post
title: "Soluções do projeto think.transform() da Ci&T"
excerpt: "Soluções do projeto think.transform() da Ci&T"
categories: blog
tags: [ciant, ci&t, mobile, algoritmo]
comments: true
share: true
---

A Ci&T está promovendo o programa think.transform() no qual ira selecionar 20 pessoas para receber treinamento de desenvolvimento mobile e fazer parte do time de colaboradores.

Ponto para Ci&T por apostar na mão de trabalho dos brasileiros e ter a ambição de tornar  BH o maior polo de desenvolvimento mobile da América Latina.

Para quem se inscreveu para essa iniciativa teve que responder algumas perguntas na ferramenta HackerRank, foram ao total 6 questões destas sendo 4 de algoritmos, 1 de banco de dados e 1 subjetiva.

Neste post vou mostras as minhas respostas para as quatros primeiras questões, que eram de algoritmo.

### 1 - FizzBuzz

{% highlight text %}
Escreva um programa que imprima os números de 1 a N, um em cada nova linha, mas para 
múltiplos de três imprima "Fizz" em vez do número, e para múltiplos de cinco 
imprima "Buzz". 
Para números que são múltiplos de tanto três e cinco imprima "FizzBuzz".

Input
Leia um único número inteiro N da entrada padrão (STDIN).

Output
N linhas com um inteiro ou string por linha conforme descrito acima.

Restrições:
N < 107

Exemplo de Input #1:
15

Exemplo de Output #1:
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
 
Explicação:
As linhas 3, 6, 9, 12 possuem a palavra "Fizz" pois são múltiplos de 3.
As linhas 5 e 10 possuem a palavra  "Buzz" pois são múltiplos de 5.
{% endhighlight %}

*Solução*

Bom esse problema não tem muito o que explicar, basta verificar se o número é multiplo de 3 e 5,
só de 3, só de 5 ou de nenhum dos dois exibindo a saída desejada.

Essa eu respondi utlizando Python, o tempo de execução é **O(n)**:

{% highlight python %}
def fizz_buzz(n):
    for i in range(1, n + 1):
        if (i % 15 == 0):
            print ("FizzBuzz")
        elif (i % 3 == 0):
            print ("Fizz")
        elif (i % 5 == 0):
            print ("Buzz")
        else:
            print (i)


n = int(input())
fizz_buzz(n)
{% endhighlight %}

A título de curiosidade fiz essa versão utilizando PHP, esta no entanto visa somente ser o mais curta possível,
para ser funcional nesse teste basta trocar o numero `101` pelo `stdin` fornecido pelo HackerRank:

{% highlight php %}
<?php while(++$i<101)echo$i%3?!$$i=$i:Fizz,$i%5?$$i:Buzz,"\n";
{% endhighlight %}

Esse problema você pode testar no HackerRank só observe que nesse tarefa, diferente do teste, ele já pré define
o intervalo desejado (1 a 100).
[FizzBuzz no HackerRank](https://www.hackerrank.com/challenges/fizzbuzz)

---

### 2 - Numerais Romanos

{% highlight text %}
O sistema de numeração romana (ou números romanos) desenvolveu-se na Roma Antiga e utilizou-se em todo o seu Império. 
Neste sistema as cifras escrevem-se com determinadas letras, que representam os números. As letras são sempre maiúsculas, 
já que no alfabeto romano não existem as minúsculas. São elas: I, V, X, L, C, D e M.
 
Desenvolva uma função que converta números indo-arábicos (algarismos de 0 a 9, padrão utilizado no Brasil) 
para o formato romano, seguindo as regras a seguir.
Cada letra corresponde a um determinado valor:
I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000
 
Agrupando as letras acima, podemos representar os números de acordo com um conjunto de regras:
 
Com exceção de V, L e D, os outros numerais podem se repetir no máximo três vezes. Exemplos: II = 2, XXX = 30, CC = 200, MMM = 3000
 
Quando escritos à direita de numerais maiores, I, X e C somam-se aos valores dos primeiros:
VIII = 5 + 1 + 1 + 1 = 8
LXII = 50 + 10 + 1 + 1 = 62
CLVIII = 158
MCXX = 1000 + 100 + 10 + 10 = 1120
 
Mas se os numerais I, X e C estiverem à esquerda dos maiores, seus valores são subtraídos como em:
IV = 5 - 1 = 4
IX = 10 - 1 = 9
XC = 100 - 10 = 90
 
Os itens unitários, dezenas, centenas e milhares devem ser considerados separadamente. Desta forma, 99 é XCIX, e nunca IC. Da mesma forma, 999 não pode ser IM e 1999 não pode ser MIM.
 
INPUT
Um número inteiro, na faixa de 1 a 3999.
 
OUTPUT
Uma string com a representação em numerais romanos do número informado.
 
EXEMPLO INPUT #1
2014
EXEMPLO OUTPUT #1
MMXIV
 
EXEMPLO INPUT #2
99
EXEMPLO OUTPUT #2
XCIX
{% endhighlight%}

Neste problema é mais complicado a organização do código do que o problema a ser resolvido.

Uma das possíveis abordagens para esse problema é dividir o número de entrada em **milhar**, **centena**, **dezena** e **unidade**, como fazemos no nosso dia a dia sem perceber.

Por exemplo o número `2514` pode ser expressado como `2000` + `500` + `10` + `4`

O `2014` como `2000` + `10` + `4`

E assim por diante.

Com isso em mente basta criar uma função que converta cada tipo de casa decimal em seu respectivo número romano.

Como o problema limita o número de entrada máximo como `3999` não fiz nenhuma verificação extra na função milhar.

Depois de implementado as funções que farão a conversão basta verificar o quantos dígitos tem o número (tamanho/length)
e chamar as respectivas funções.

Essa função eu fiz utilizando PHP, o tempo de execução desse algoritmo é de **O(1)**

{% highlight php %}
<?php
function milhar($num) {
    return str_repeat("M", $num);
}

function centena($num) {
    $res = '';
    if ( ($num > 0) && ($num < 4) ) {
        $res = str_repeat("C", $num);
    }
    elseif ($num == 4) {
        $res = "CD";
    }
    elseif ( ($num > 4) && ($num < 9) ) {
        $res = "D" .  str_repeat("C", ($num - 5));
    }
    elseif ($num == 9) {
        $res = "CM";
    }
 
    return $res;
}

function dezena($num) {
    $res = '';
    if ( ($num > 0) && ($num < 4) ) {
        $res = str_repeat("X", $num);
    }
    elseif ($num == 4) {
        $res = "XL";
    }
    elseif ( ($num > 4) && ($num < 9) ) {
        $res = "L" .  str_repeat("X", ($num - 5));
    }
    elseif ($num == 9) {
        $res = "XC";
    }
 
    return $res;
}

function unidade($num) {
    $res = '';
    if ( ($num > 0) && ($num < 4) ) {
        $res = str_repeat("I", $num);
    }
    elseif ($num == 4) {
        $res = "IV";
    }
    elseif ( ($num > 4) && ($num < 9) ) {
        $res = "V" .  str_repeat("I", ($num - 5));
    }
    elseif ($num == 9) {
        $res = "IX";
    }
 
    return $res;
}

function integerToRoman( $num) {
    $len = strlen($num);
    $num = str_split($num);

    $res = '';
    if ($len == 4) {
        $res = milhar($num[0]) . centena($num[1]) . dezena($num[2]) . unidade($num[3]);
    }
    elseif ($len == 3) {
        $res = centena($num[0]) . dezena($num[1]) . unidade($num[2]);
    }
    elseif ($len == 2) {
        $res = dezena($num[0]) . unidade($num[1]);
    }
    else {
        $res = unidade($num[0]);
    }
    
    return $res;
}
{% endhighlight %}

---

### 3 - String Balanceada

{% highlight text %}
Implemente um método chamado checkBalance que recebe um string composta de um conjunto entre os caracteres {}()[] e retorna 0 caso ela esteja balanceada, e 1 caso contrário.
 
Uma string está balanceada se as seguintes condições forem verdadeiras:
	se ela for uma string vazia
	se A e B estão balanceadas, AB também está balanceada.
	se A está balanceada, (A), {A} e [A] também estão balanceadas.
 
Exemplos de Input:
{}()[]
([{()}])
{[}
 
 
Exemplos de Output:
0
0
1
{% endhighlight %}

Esse aqui é um pouco mais complicad, mas mesmo assim possível de resolver. 
Queria implementar em C++ mas não estava disponível essa linguagem no teste, então escolhi 
PHP por ser muito parecida com C++.

Basicamente seria um mini analizador léxico, mas não fazia idéia por onde começar esse sem consultar algum material, 
então decidi utilizar uma estrutura de `stack`.

A solução verifica se o valor da string atual é algum item de abertura `{`, `(` ou `[` e insere no `stack`.
Se o item for algum de fechamento `}`, `)` ou `]` eu verifico com o item no topo do `stack`.
Se são pares remove o item do `stack` caso contrario a string não será balanceada.

Como já mencionei a solução está em PHP e o tempo de execução é de **O(n)**

{% highlight php %}
<?php
function pares($a, $b) {
    if($a == '(' && $b == ')') return true;
	else if($a == '{' && $b == '}') return true;
	else if($a == '[' && $b == ']') return true;
	return false;
}

function checkBalance( $inputstr) {
	$arr = array();
    
	for($i = 0; $i < strlen($inputstr); $i++)
	{
		if( $inputstr[$i] == '(' || $inputstr[$i] == '{' || $inputstr[$i] == '[') {
			array_push($arr, $inputstr[$i]);
		}
		else if($inputstr[$i] == ')' || $inputstr[$i] == '}' || $inputstr[$i] == ']')
		{
			$top = array_pop($arr);
			array_push($arr, $top);
			if (empty($arr) || !pares($top, $inputstr[$i])) {
				continue;
			}
			else {
				array_pop($arr);
			}
		}
	}
    
    return empty($arr) ? "0":"1";
}
{%endhighlight%}

---

### 4 - Células visitadas

{% highlight text %}
Babai está parado na célula do topo, à esquerda (1, 1) de um grid N x M (N linhas e M colunas), inicialmente olhando para a célula à sua direita. Ele se movimenta pelo grid da seguinte maneira:
 
	Se a célula à sua frente faz parte do grid e ainda não foi visitada, ele dá um passo à frente e vira para sua direita.
	Se não, ele vira para sua direita, e tenta o passo 1 novamente.
	Se ele não consegue mais virar à direita (já tentou o passo 2 quatro vezes), ele para de andar.
 
Ele anda pelo grid e visita quantas células ele conseguir. Seu objetivo é descobrir quantas células ele visitou antes de parar.
 
Aqui está um exemplo do movimento de Babai em um grid 9x9. O número em cada célula determina a sequência que ele passou por ela:
 
 1   2  55  54  51  50  47  46  45
 4   3  56  53  52  49  48  43  44
 5   6  57  58  79  78  77  42  41
 8   7  60  59  80  75  76  39  40
 9  10  61  62  81  74  73  38  37
12  11  64  63  68  69  72  35  36
13  14  65  66  67  70  71  34  33
16  15  20  21  24  25  28  29  32
17  18  19  22  23  26  27  30  31 
 
Input:
A entrada é dois inteiros, N e M em linhas distintas.
 
Output:
Imprima um único número inteiro que representa o número de células visitadas no grid informado.
 
Constraint:
N e M são valores inteiros entre 1 e 100.
 
Exemplo de Input #1:
3
3
 
Exemplo de Output #2:
9
 
Explicação #1:
As células são visitadas na sequência indicada pelos números abaixo:
 
 1  2  9
 4  3  8
 5  6  7
 
Exemplo de Input #2:
7
4
 
Exemplo de Output #2:
18
 
Explicação #2:
As células são visitadas na sequência indicada pelos números abaixo (as indicadas por 0 nunca foram visitadas):
 1  2  0  0
 4  3  0  0
 5  6  0  0
 8  7  0  0
 9 10  0  0
12 11 16 17
13 14 15 18
{% endhighlight %}

Acredito que essa era a questão mais difícil, devido ao problema te direcionar para uma solução utilizando arrays multidimensionais.

Uma solução nem tão otimizada já que no melhor caso teriamos que utilizar no mínimo dois loops aninhados, cada um com tempo de execução de *O(n)* o que resultaria no melhor caso em um algoritmo com tempo de execução de **O(nˆ2)**.

Então desenhando algumas possíveis combinações cheguei a uma solução mais elegante que reduz o tempo de execução drasticamente.
Observando o padrão de repetição dos caminhos notei 3 sitações distintas:

 * Se `N` for um número par ele sempre vai ficar preso no final do caminho. 
Então nesse caso, indenpendente do valor de `M`, o valor da última 
célula visitada será dado por `N * 2`.

 * Para fechar as possíbilidades para esse problema caso o `N` seja ímpar temos que analizar `M`:
    * Se `M` for par o caminho vai seguir em frente ao alcançar o final de `N` mas ficará preso no final de `M`.
Assim o valor para essa situação será `( (N * 2) + ((M * 2) - 4) )`. Retira-se 4 elementos pois estes serão
preenchidos na volta de `N`.
    * Na última situação temos `M` ímpar. Neste caso todo caminho será percorrido até ser encontrado a última célula vazia, 
seu valor será dado por `N * M`

Maravilha assim passamos de uma solução de *O(nˆ2)* para uma solução com tempo de execução de **O(1)**, lindo =D

{% highlight php %}
<?php
function totalCellsVisited( $n,  $m) {
    if ($n & 1) {
        if ($m & 1) {
            return $n * $m;
        }
        else {
            return ($n * 2) + (($m * 2) - 4);
        }
    }
    else {
        return $n * 2;
    }
}
{% endhighlight %} 