% ===========================================================================
\documentclass[a4paper,oneside,spanish]{article}
\usepackage[spanish,read]{nwprog}
% ===========================================================================

\isodate

\newcommand{\ProgTitle}{Cociente y Resto}
\newcommand{\ProgAuth}{Javier Goizueta} 
\newcommand{\ProgDate}{Javier Goizueta 2001-2004} % started: 2001-03-06
\newcommand{\ProgVer}{1.0}
\newcommand{\ProgSource}{\ttfamily\bfseries mod.w}

\title{\ProgTitle}
\author{\ProgAuth} 
\date{\ProgDate}

% ===========================================================================

% Nota: los gr�ficos EPS han sido generados con Mathematica, (ver math/mod.nb),
% pero he tenido que sumar 356 (puntos) a las coordenadas Y del "bounding box".

% Nota: con la �ltima versi�n de babel, \bmod se muestra en castellano con acento

\begin{document}

% =====================================================================================================
\section{Cociente y Resto}

% Nota: el archivo math/mod.nb contiene las definiciones de los gr�ficos de
% esta secci�n, que deben se exportados a los archivos 
% modpos.eps modpos.eps rem.eps c99rem.eps
% En los archivos rem.eps y c99rem.eps se debe reemplazar "\310" por "|"

% Las funciones de conversi�n a enteros definidas m�s arriba nos permiten definir la divisi�n entera
% y el resto o m�dulo.

Hay dos definiciones de cociente y resto que aparecen frecuentemente en los distintos lenguajes
de programaci�n y bibliotecas de funciones.
Estas dos corresponden a dos maneras de expresar el cociente
de dos n�meros, $x/y$, como suma de una parte entera, $c y$, y un resto $r$ cuyo valor absoluto sea
menor que el de $y$.
\[x/y=cy+r\]

\subsection{Primera definici�n}

La definici�n con mayor inter�s matem�tico es la siguiente:
\begin{eqnarray*}
c_m &=& \lfloor{x/y}\rfloor \\
r_m &=& x - y c_m = x \bmod y
\end{eqnarray*}

El resto $r_m$ corresponde con la funci�n m�dulo, $x \bmod y$, y es un valor c�clico entre $0$ e $y$ que tiene
el mismo signo que el divisor, $y$.
\(
\left\{ \begin{array}{cc}
          0\geq r_m >y  & \mbox{si $y< 0$} \\
          0\leq r_m <y  & \mbox{si $y> 0$} 
        \end{array}
\right.
\)


\begin{figure}[!htbp]
\begin{center}
\begin{tabular}{cc}
\includegraphics[height=4cm]{fig/modpos.eps} & \includegraphics[height=4cm]{fig/modneg.eps} \\
$r_m(x); y>0$ & $r_m(x); y<0$
\end{tabular}
\end{center}
\end{figure}

\subsubsection{Ejemplos}

\begin{itemize}
\item
Esta forma de cociente y resto corresponde las funciones de Mathematica
\cd{Quotient[x,y]}$=c_m$ y \cd{Mod[x,y]}$=r_m$.
\item
El resto es la funci�n \cd{x y MOD}$=r_m$ de RPL.
Las calculadoras de la serie HP49 tienen un sistema CAS
(\ex{Computer Algebra System}) que incluye estas funciones para enteros:
\cd{x y IQUOT}$=c_m$; \cd{x y IREMAINDER}$=r_m$;
\cd{x y IDIV2}$=c_m, r_m$.
La calculadora HP-35s tiene las funciones
\cd{x y INT$\div$}$=r_m$  y \cd{x y Rmdr}$=r_m$ en el men� \cd{INTG}
\item
La funci�n \verb|Numeric#divmod| de Ruby
calcula $c_m$ y $r_m$; la funci�n \verb|Numeric#div| calcula $c_m$
y la funci�n \verb|Numeric#modulo| calcula $r_m$.
\item
Los operadores \verb|/| y \verb|%| de Ruby y Python corresponden, para valores enteros de 
$x$ e $y$, a $c_m$ y $r_m$: \verb|x/y|$=c_m$ y \verb|x%y|$=r_m$. En Python, a partir de la
versi�n 2.2 se ha introducido en operador \verb|//| con este sentido, \verb|x//y|$=c_m$,
y el operador \verb|/| va a cambiar de significado.
%    ver PEP 238: http://www.python.org/peps/pep-0238.html
%          (antes http://python.sourceforge.net/peps/pep-0238.html)
\item
Excel tiene la funci�n:
\cd{MOD(x,y)}$\equiv$\cd{RESIDUO(x;y)}$=r_m$
\end{itemize}

\pagebreak
\subsection{Segunda definici�n}

La segunda forma es frecuente en muchos lenguajes de programaci�n como
divisi�n de n�meros enteros:
\begin{eqnarray*}
c_d &=& {\cal E}({x/y}) \\
r_d &=& x - y c_d = y{\cal F}({x/y}) = |y|{\cal F}({x/|y|})
\end{eqnarray*}

El resto $r_d$ as� calculado tiene el mismo signo que el dividendo $x$.
\begin{figure}[!htbp]
\begin{center}
\begin{tabular}{c}
\includegraphics[height=4cm]{fig/rem.eps} \\
$r_d(x)$
\end{tabular}
\end{center}
\end{figure}

La relaci�n entre $r_d$ y $r_m$ es sencilla: $r_d$ es igual a $r_m$ cambiando
el signo de $y$ cuando es diferente al de $x$: 
(${\cal S}$ es la funci�n {\emph signo})
\begin{eqnarray*}
r_d(x,y) &=& r_m(x, y{\cal S}(x){\cal S}(y)) \\
{\cal S}(x) &=& \left\{\begin{array}{cc}
x / |x| & \mbox{si $x\neq 0$} \\
0 & \mbox{si $x=0$} \\
\end{array}\right.
\end{eqnarray*}

\subsubsection{Ejemplos}

\begin{itemize}
\item
La instrucci�n \cd{IDIV} de los procesadores Intel (\ex{integer division})
opera sobre n�meros enteros y calcula $c_d$ y $r_d$.
\item
La funci�n \cd{fmod} de la bibliot�ca est�ndar de C corresponde a $r_d$:
\cd{fmod(x,y)}$=r_d$.
\item
La funci�n \cd{modf(x,\&temp)} de C calcula $r_d$ para $y=1$
(por tanto $r_m$ para $y={\cal S}(x)$); el valor calculado en \cd{*temp}
es $c_d$ para $y=1$.
\item
Para valores enteros, los operadores \verb|/| y \verb|%| de C/C++ 
corresponden habitualmente a $c_d$ y $r_d$, pero los est�ndares de estos lenguajes
no requieren obligatoriamente este comportamiento.
La funcio�n \cd{div} calcula simult�neamente el cociente y resto y suele
corresponder con los operadores mencionados, aunque algunas implementaciones
calculan $c_m$ y $r_m$.
\item
La funci�n \verb|Numeric#remainder| de Ruby corresponde a $r_d$, y 
la expresi�n \verb|(Float(x)/Float(y)).truncate| en Ruby permite calcular $c_d$.
% nota: para \cd{x}, \cd{y} de tipo \cd{Integer}, la expresi�n no equivale a \verb|x/y|: (-7)/3 == -3
\item La {\em General Decimal Arithmetic Specification} de fine las funciones \verb|divide-integer|
y \verb|remainder| como $c_d$ y $r_d$ respectivamente.
\end{itemize}

\pagebreak
\subsection{Otras definiciones}
%Variante:
%\begin{eqnarray*}
%r_d' &=& (y/|y|)(x - y c_d) = {\cal F}({x/y})
%\end{eqnarray*}
%El resto $r_d'$ as� calculado tiene el mismo signo que el cociente $x/y$.
%\begin{figure}[!htbp]
%\begin{center}
%\begin{tabular}{cc}
%\includegraphics[height=4cm]{fig/rempos.eps} & \includegraphics[height=4cm]{fig/remneg.eps} \\
%$r_d'(x); y>0$ & $r_d'(x); y<0$
%\end{tabular}
%\end{center}
%\end{figure}

Las funciones \cd{remainder} y \c{remquo} de la biblioteca est�ndar de C99
calculan el resto de la divisi�n con redondeo:
\[\mbox{\cd{remainder(x,y) = remquo(x,y,\&temp)}} = x-y{\cal R}_2(x/y)\]
\begin{figure}[!h]
\begin{center}
\begin{tabular}{c}
\includegraphics[height=4cm]{fig/c99rem.eps} \\
\cd{remainder(x,y)} para $y$ fijo
\end{tabular}
\end{center}
\end{figure}
%remquo almacena tres bits de x/y como lo hace FPREM1,
%para facilitar el c�lculo de la funci�n tangente
La operaci�n FPREM1 de los procesadores de coma flotante de intel
(a partir del 80387) realiza tambi�n esta operaci�n.
En la {\em General Decimal Arithmetic Specification} esta operaci�n se denomina
\cd{remainder-near}.

% 8087 FPREM, FIDIV, FIDIVR

\end{document}
