% ===========================================================================
\documentclass[a4paper,oneside,spanish]{article}
\usepackage[spanish,read]{nwprog}
% ===========================================================================

\isodate

\newcommand{\ProgTitle}{Redondeo numérico y lenguajes de programación}
\newcommand{\ProgAuth}{Javier Goizueta} 
\newcommand{\ProgDate}{Javier Goizueta 2001--2004} % started 2001-01-22
\newcommand{\ProgVer}{1.0}
\newcommand{\ProgSource}{\ttfamily\bfseries round.w}

\title{\ProgTitle}
\author{\ProgAuth} 
\date{\ProgDate}

% ===========================================================================

\usepackage{amssymb}
%\usepackage{amsmath}
\usepackage{amsfonts}

% - - - - - - - - - - - - - - - - -

% Nota: los gráficos EPS han sido generados con Mathematica, (ver math/round.nb),
% pero he tenido que sumar 356 (puntos) a las coordenadas Y del "bounding box".

\begin{document}

% =====================================================================================================
\section{Funciones de redondeo}

Existe cierta confusión sobre el funcionamiento de las distintas operaciones de conversión
de números no enteros a enteros disponibles en algunos lenguajes de programación.
En este documento se trata de clarificar la situación e introducir algunas subrutinas útiles
para la programación.

Veremos en primer lugar las funciones matemáticas fundamentales que convierten números reales en enteros, 
y las distintas funciones disponibles para implementarlas en una selección de
lenguajes de programación.
Los lenguajes que consideraremos son:

\addvspace{1em}

\begin{tabular}[t]{rl}
\emph{C/C++:} & Funciones de las bibliotecas estándar \\
\emph{Ruby:} & Módulos de la biblioteca estándar \\
\emph{Python:} & Módulos de la biblioteca estándar \\
\emph{ECMAScript:} & Objetos nativos del estándar de JavaScript \\
\emph{Java:} & Clases del módulo \cd{java.lang} \\
\emph{C\#:} & Bibliotecas del sistema \cd{.NET} \\
\emph{Mathematica:} & Funciones incorporadas del sistema \\
\emph{RPL:} & Lenguaje User-RPL de las calculadoras HP (28, 48, 49)\\
\emph{Visual Basic:} & Funciones de Microsoft VB 6, VBA, VBScript \\
\emph{Fortran:} & Funciones intrínsecas de Fortran77 \\
\emph{Pascal:} & Rutinas estándar de Object Pascal (Delphi/Kylix)  \\
\end{tabular}


% -----------------------------------------------------------------------------------------------------
\subsection{Entero inferior}
La función \ex{floor}, $\lfloor x\rfloor$, a veces denotada $[x]$, es el mayor entero menor o igual que $x$.
También es conocida por el nombre francés \ex{entier}.

\begin{figure}[!h]
\begin{tabular}[t]{cc}
\begin{tabular}[b]{rl}
\emph{C/C++:} & \cd{floor(x)} \\
\emph{Ruby:} & \cd{x.floor} \\
\emph{Python:} & \cd{math.floor(x)} \\
\emph{ECMAScript:} & \cd{Math.floor(x)} \\
\emph{Java:} & \cd{java.lang.Math.floor(x)} \\
\emph{C\# (.NET):} & \cd{System.Math.Floor(x)} \\
\emph{Mathematica:} & \cd{Floor[x]} \\
\emph{RPL:} & \cd{x FLOOR} \\
\emph{Visual Basic:} & \cd{Int(x)} \\
\end{tabular} & \includegraphics[height=4cm]{fig/floor.eps} \\
& $\lfloor x\rfloor$
\end{tabular}
%\caption{$\lfloor x\rfloor$}
\end{figure}


% -----------------------------------------------------------------------------------------------------
\subsection{Entero superior}
La función \ex{ceiling}, $\lceil x\rceil=-\lfloor-x\rfloor$, es el menor entero mayor o igual que $x$.

\begin{figure}[!h]
\begin{tabular}[t]{cc}
\begin{tabular}[b]{rl}
\emph{C/C++:} & \cd{ceil(x)} \\
\emph{Ruby:} & \cd{x.ceil} \\
\emph{Python:} & \cd{math.ceil(x)} \\
\emph{ECMAScript:} & \cd{Math.ceil(x)} \\
\emph{Java:} & \cd{java.lang.Math.ceil(x)} \\
\emph{C\# (.NET):} & \cd{System.Math.Ceiling(x)} \\
\emph{Mathematica:} & \cd{Ceiling[x]} \\
\emph{RPL:} & \cd{x CEIL} \\
\emph{Visual Basic:} & \cd{-Int(-x)} \\
\end{tabular} & \includegraphics[height=4cm]{fig/ceil.eps} \\
& $\lceil x\rceil$
\end{tabular}
%\caption{$\lceil x\rceil$}
\end{figure}

\pagebreak

% -----------------------------------------------------------------------------------------------------
\subsection{Parte entera}
Ésta es la función que devuelve la parte entera de un número:
\({\cal E}(x)=
\left\{ \begin{array}{cc}
          \lfloor x\rfloor & \mbox{si $x\geqslant 0$} \\
          \lceil x\rceil & \mbox{si $x<0$}
        \end{array}
\right.
\)

\begin{figure}[!h]
\begin{tabular}[t]{cc}
\begin{tabular}[b]{rl}
\emph{Ruby:} & \cd{x.truncate = x.to\_i} \\
\emph{Mathematica:} & \cd{IntegerPart[x]} \\
\emph{RPL:} & \cd{x IP} \\
\emph{Visual Basic:} & \cd{Fix(x)} \\
%\emph{8087:} & \cd{chop} \\
\emph{Pascal:} & \cd{Trunc(x)} \\
\emph{Fortran:} & \cd{AINT(x)} \\
\end{tabular} & \includegraphics[height=4cm]{fig/ip.eps} \\
& ${\cal E}(x)$
\end{tabular}
%\caption{${\cal E}(x)$}
\end{figure}


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\subsubsection{Parte fraccionaria}
La parte fraccionaria es ${\cal F}(x)=x-{\cal E}(x)$.

\begin{figure}[!h]
\begin{tabular}[t]{cc}
\begin{tabular}[b]{rl}
\emph{Mathematica:} & \cd{FractionalPart[x]} \\
\emph{RPL:} & \cd{x FP} \\
\emph{Visual Basic:} & \cd{x-Fix(x)} \\
\emph{Pascal:} & \cd{Frac(x)} \\
\end{tabular} & \includegraphics[height=4cm]{fig/frac.eps} \\
& ${\cal F}(x)$
\end{tabular}
%\caption{${\cal F}(x)$}
\end{figure}




% -----------------------------------------------------------------------------------------------------
\subsection{Redondeo}
Podemos definir diferentes funciones para calcular el entero más cercano a un número según
cuál sea el tratamiento de los números el conjunto 
$\mathcal{M}=\{x|\:|{\cal F}(x)|={1/2}\}=\{x|x+1/2\in\mathbb{Z}\}$, ya
que éstos número son equidistantes de los enteros inferior y superior más cercanos.
\begin{eqnarray*}
{\cal R}_{+\infty}(x)&=&\lfloor{x+{1/2}}\rfloor\\
{\cal R}_{-\infty}(x)&=&\lceil{x-{1/2}}\rceil\\
{\cal R}_{0}(x)&=&\left\{ \begin{array}{cc}
                        \lceil{x-{1/2}}\rceil  & \mbox{si $x\geqslant 0$} \\
                        \lfloor{x+{1/2}}\rfloor  & \mbox{si $x<0$}
                     \end{array}
             \right. \\
{\cal R}(x)\equiv{\cal R}_{\infty}(x)&=&\left\{ \begin{array}{cc}
                        \lfloor{x+{1/2}}\rfloor = {\cal E}(x+{1/2}) & \mbox{si $x\geqslant 0$} \\
                        \lceil{x-{1/2}}\rceil = {\cal E}(x-{1/2}) & \mbox{si $x<0$} \\
                     \end{array}
             \right.             
\end{eqnarray*}

% banker's rounding, unbiased rounding, round to even (ambiguous name), gaussian rounding
Para evitar sesgos en el tratamiento de los números de $\mathcal{M}$, se suele usar en la práctima la regla
de redondeo conocidad como ``bancaria'' o ``gaussiana'', ${\cal R}_2$, según la cual se redondean siempre
los valores de $\mathcal{M}$ a números pares.
De forma simétrica podemos definir una regla ${\cal R}_1$ que redondee $\mathcal{M}$ a números impares:
% aunque no se usa en la práctica:
\begin{eqnarray*}
{\cal R}_{2}(x)&=&\left\{ \begin{array}{cc}                       
                        2\lfloor{\frac{x+{1/2}}{2}}\rfloor & \mbox{si $x\in\mathcal{M}$} \\
                        {\cal R}(x)={\cal R}_0(x)={\cal R}_{+\infty}={\cal R}_{-\infty}
                             & \mbox{si $x\not\in\mathcal{M}$}
                     \end{array}
             \right. \\
{\cal R}_{1}(x)&=&\left\{ \begin{array}{cc}                       
                        2\lfloor{\frac{x-{1/2}}{2}}\rfloor+1 & \mbox{si $x\in\mathcal{M}$} \\
                        {\cal R}(x)={\cal R}_0(x)={\cal R}_{+\infty}={\cal R}_{-\infty}
                             & \mbox{si $x\not\in\mathcal{M}$}
                     \end{array}
             \right.
\end{eqnarray*}



%Tenemos que:
%\[
%x\in\mathcal{M}\Rightarrow{\cal R}_2(x)-{\cal R}(x)=\frac{|x|}{x}\left[{\frac{{{(-1)}^{|x|+1/2}}-1}{2}}\right]
%=\left\{\begin{array}{cc}
%   {\frac{{{(-1)}^{x+1/2}}-1}{2}} & \mbox{si $x\geqslant 0$} \\
%   {\frac{{{(-1)}^{x+1/2}}+1}{2}} & \mbox{si $x<0$} 
%\end{array}\right.
%\]

\begin{tabular}{rl}
\emph{Ruby:} & \cd{x.round}$={\cal R}(x)$ \\
\emph{Python:} & \cd{round(x)}$={\cal R}(x)$ \\
\emph{ECMAScript:} & \cd{Math.round(x)}$={\cal R}(x)$ \\
\emph{Java:} & \cd{java.lang.Math.round(x)}$={\cal R}_{+\infty}(x)$ \\
\emph{C\# (.NET):} & \cd{System.Math.Round(x)}$={\cal R}_2(x)$ \\
\emph{Mathematica:} & \cd{Round[x]}$={\cal R}_2(x)$ \\
\emph{RPL (HP48,HP49):} & \cd{x 0 RND}$={\cal R}(x)$ \\
\emph{Visual Basic:} & \cd{Round(x)}$={\cal R}_2(x)$ \\
\emph{Fortran:} & \cd{ANINT(x)}$={\cal R}(x)$ \\
\emph{Pascal:} & \cd{Round(x)}$={\cal R}_2(x)$ \\
\end{tabular}

\begin{figure}[!htbp]
\begin{center}
\begin{tabular}{cc}
\includegraphics[height=4cm]{fig/rpos.eps} & \includegraphics[height=4cm]{fig/rneg.eps} \\
${\cal R}_{+\infty}(x)$ & ${\cal R}_{-\infty}(x)$
%\caption{${\cal R}_{+\infty}(x)$}
%\caption{${\cal R}_{-\infty}(x)$}
\end{tabular}
\end{center}
\end{figure}

\begin{figure}[!htbp]
\begin{center}
\begin{tabular}{cc}
\includegraphics[height=4cm]{fig/rzero.eps} & \includegraphics[height=4cm]{fig/rinf.eps} \\
${\cal R}_{0}(x)$ & ${\cal R}(x)$
\end{tabular}
%\caption{${\cal R}_{0}(x)$}
%\caption{${\cal R}(x)$}
\end{center}
\end{figure}

\begin{figure}[!htbp]
\begin{center}
\begin{tabular}{cc}
\includegraphics[height=4cm]{fig/r2.eps} & \includegraphics[height=4cm]{fig/r1.eps} \\
${\cal R}_2(x)$ & ${\cal R}_1(x)$
\end{tabular}
% \caption{${\cal R}_2(x)$}
\end{center}
\end{figure}

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\subsubsection{Redondeo en un dígito determinado}


Para redondear con $n$ dígitos decimales podemos calcular 
${\cal R}_n(x)={{{\cal R}(10^n x)}/{10^n}}$, 
y análogamente,
${\cal R}_{2,n}(x)$,
${\cal R}_{0,n}(x)$,
${\cal R}_{-\infty,n}(x)$ y
${\cal R}_{+\infty,n}(x)$.

\addvspace{1em}

\begin{tabular}{rl}
\emph{Python:} & \cd{round(x,n)}$={\cal R}_n(x)$ \\
\emph{C\# (.NET):} & \cd{System.Math.Round(x,n)}$={\cal R}_{2,n}(x)$ \\
\emph{Mathematica:} & \verb|Round[x*10^n]/10^n|$={\cal R}_{2,n}(x)$ \\
\emph{RPL (HP48,HP49):} & \cd{x n RND}$={\cal R}_n(x)$ \\
\emph{Visual Basic:} & \cd{Round(x,n)}$={\cal R}_{2,n}(x)$ \\
\end{tabular}

\addvspace{1em}

%RPL: x n TRNC = $={\cal E}_n(x)$


También puede ser necesario redondear con $m$ dígitos de \emph{precisión}. En este caso se deben
contar estos dígitos entre los más significativos de la cifra, en lugar de entre los
decimales. Esto se puede lograr sencillamente aplicando el redondeo con $n$ dígitos decimales,
siendo $n=m-1-\lfloor{\lg{|x|}}\rfloor$. 
En algunos lenguajes, como RPL, esta característica está disponible empleando un número
de dígitos negativos, $-m$.

Igualmente podríamos redondear en un dígito determinado de la expresión
del valor en una base arbitraria $b$:
${\cal R}^b_n(x)={{{\cal R}(b^n x)}/{b^n}}$, 
y análogamente,
${\cal R}^b_{2,n}(x)$,
${\cal R}^b_{0,n}(x)$,
${\cal R}^b_{-\infty,n}(x)$ y
${\cal R}^b_{+\infty,n}(x)$.



% =====================================================================================================
\section{Programación}

Definiremos aquí algunas funciones de redondeo no presentes en algunos lenguajes.
Podemos calcular cualquiera de las funciones más interesantes de redondeo disponiendo únicamente
de la función $\lfloor x\rfloor$:

\begin{itemize}
\item $\lceil x\rceil=-\lfloor-x\rfloor$
\item \({\cal E}(x)=
  \left\{ \begin{array}{cc}
          \lfloor x\rfloor & \mbox{si $x\geqslant 0$} \\
          \lceil x\rceil & \mbox{si $x<0$}
        \end{array}
  \right.
  \)
\item ${\cal F}(x)=x-{\cal E}(x)$
\item ${\cal R}_{+\infty}(x)=\lfloor{x+{1/2}}\rfloor$
\item ${\cal R}_{-\infty}(x)=\lceil{x-{1/2}}\rceil$
\item \({\cal R}_{0}(x)=\left\{ \begin{array}{cc}
                        \lceil{x-{1/2}}\rceil  & \mbox{si $x\geqslant 0$} \\
                        \lfloor{x+{1/2}}\rfloor  & \mbox{si $x<0$} 
                     \end{array}
             \right.\)
\item \({\cal R}(x)=\left\{ \begin{array}{cc}
                        \lfloor{x+{1/2}}\rfloor & \mbox{si $x\geqslant 0$} \\
                        \lceil{x-{1/2}}\rceil & \mbox{si $x<0$} \\
                     \end{array}
             \right.\)
\item ${\cal M}=\{x|\lfloor x\rfloor+{1/2}=x\}$
\item \({\cal R}_{2}(x)=\left\{ \begin{array}{cc}                       
                        2\lfloor{\frac{x+{1/2}}{2}}\rfloor & \mbox{si $x\in\mathcal{M}$} \\
                        \lfloor{x+{1/2}}\rfloor            & \mbox{si $x\not\in\mathcal{M}$}
                     \end{array}
             \right.\)
\end{itemize}


Si no se dispone de la función $\lfloor x\rfloor$, se puede calcular esta, (y por tanto todas las demás),
empleando ${\cal E}(x)$ 
o en general cualquier función $f(x)$ tal que $\forall x\geqslant 0, f(x)=\lfloor x\rfloor$
\[
\lfloor x\rfloor=
  \left\{ \begin{array}{cc}
          f(x) & \mbox{si $x\geqslant 0$} \\
          f\left({f(-x)+1+x}\right)-f(-x)-1 & \mbox{si $x<0$}
        \end{array}
 \right.
\]

Para cualquiera de las funciones $f$ de redondeo podemos calcular una función $f_n$ que
aplique el redondeo al dígito decimal $n$,
y, con más generalidad, una función $f_{\langle k\rangle}$ 
que redondée a un múltiplo de $k$. (tendremos que $f_n(x)=f_{\langle 10^{-n}\rangle}$).
\begin{itemize}
\item$f_n(x)=f(10^n x)/{10^n}$
\item$f_{\langle k\rangle}=kf(x/k)$
\end{itemize}

También podemos definir una función $f^m$ que aplique el redondeo $f$ al dígito significativo $m$ así:
\begin{itemize}
\item$f^m(x)=f_{m-1-\lfloor{\lg{|x|}}\rfloor}(x)$
\end{itemize}



% -----------------------------------------------------------------------------------------------------
\subsection{Visual Basic}

El lenguaje Visual Basic carece de una función de redondeo hacia infinito ${\cal R}(x)$. 
Definiremos una función \cd{RoundI} para ello.

El valor que deseamos calcular es \verb|Fix(x*10^d+0.5*Sgn(x))/10^d|,
pero trataremos de lograr una mayor eficiencia:

@o vb/roundi.bas 
@{@%
Public Function RoundI(ByVal x As Double, Optional ByVal d As Integer = 0) As Double
  Dim m As Double
  m = 10^d
  If x < 0 Then 
    RoundI = Fix(x*m - 0.5) / m
  Else 
    RoundI = Fix(x*m + 0.5) / m
  End If
End Function
@}

Nota: Muchos programas emplean la expresión \cd{Int(x+0.5)} para realizar redondeos en Visual Basic; 
esto equivale a la función ${\cal R}_{+\infty}(x)$.

% -----------------------------------------------------------------------------------------------------
\subsection{C++}

Las siguientes funciones están escritas en C++, pero es muy sencillo traducirlas a C.
%Eliminando los espacios de nombres (\ex{namespaces}),
%los cualificadores \cd{std::} y los valores por
%defecto de parámetros en la declaración de funciones, 
%el código aquí definido será válido también en lenguaje C.
%(y los comentarios \verb|//| tendrán que ser convertidos a \verb|/* ... */|)

@o c/round.h -d
@{@%
#ifndef ROUNDING_H
#define ROUNDING_H
namespace rounding {
@<Declaraciones de funciones de redondeo@>
};
#endif
@}

@o c/round.cpp -d
@{@%
#include "round.h"
namespace rounding {
@<Definiciones de funciones de redondeo@>
};
@}

Definiremos dos funciones en C++ para calcular ${\cal E}(x)$ y ${\cal F}(x)$.
@d Declaraciones de funciones de redondeo
@{@%
double integer_part(double);
double fractional_part(double);
@}

Ésta es la función ${\cal E}(x)$, que equivale a \cd{(x<0) ? std::ceil(x) : std::floor(x)}.
@d Definiciones de funciones de redondeo
@{@%
double integer_part(double x) // (x<0) ? std::ceil(x) : std::floor(x)
{ 
  static double y;
  std::modf(x,&y);
  return y;  
}
@}

Y ésta, ${\cal F}(x)$, y equivale a \cd{x-integer\_part(x)}.
@d Definiciones de funciones de redondeo
@{@%
double fractional_part(double x) // x-integer_part(x)
{  
  static double y;
  return std::modf(x,&y);
}
@}

Las bibliotecas estándar de C y C++ carecen de funciones de redondeo. Definiremos aquí las
más usadas. 

En primer lugar, ${\cal R}(x)$.
@d Declaraciones de funciones de redondeo
@{@%
double round_inf(double x, int d=0);
@}
@d Definiciones de funciones de redondeo
@{@%
double round_inf(double x, int d)
{
  if (d==0)
    return x < 0.0 ? std::ceil(x-0.5) : std::floor(x+0.5);
  double m = std::pow(10.0,d);
  return x<0.0 ? std::ceil(x*m-0.5)/m : std::floor(x*m-0.5)/m;
}
@}

Implementaremos también el redondeo bancario ${\cal R}_2(x)
=\left\{ \begin{array}{cc}                       
        2\lfloor{\frac{x+{1/2}}{2}}\rfloor & \mbox{si $x\in\mathcal{M}$} \\
         \lfloor{x+{1/2}}\rfloor & \mbox{si $x\not\in\mathcal{M}$}
                     \end{array}
             \right.$

@d Declaraciones de funciones de redondeo
@{@%
double round_unbiased(double x, int d=0);
@}

@d Definiciones de funciones de redondeo
@{@%
double round_unbiased(double x, int d)
{
  double m = pow(10.0,d);
  x *= m;
  x += 0.5;
  x = (fractional_part(x)==0.0) ? 2.0*std::floor(x*0.5) : std::floor(x);
  return x/m;  
}
@}

También podríamos haber usado únicamente la función \cd{floor} así:
@d Alternativa sin \cd{fractional\_part}
@{@%
double round_unbiased(double x, int d)
{
  double m = pow(10.0,d);
  x *= m;
  x += 0.5;
  double y = std::floor(x);
  x = (x==y) ? 2.0*std::floor(x*0.5) : y;
  return y/m;  
}
@}


% -----------------------------------------------------------------------------------------------------
\subsection{Mathematica}

Las funciones ${\cal R}(x)$, ${\cal R}_{+\infty}(x)$, ${\cal R}_{-\infty}(x)$, ${\cal R}_{0}(x)$
y ${\cal R}_{1}(x)$ no están presentes en Mathematica, y las definiremos aquí.

La función \cd{RoundUp[x]} implementa ${\cal R}_{+\infty}(x)$:
@o math/round.m
@{@%
RoundUp[x_] := Floor[x + 0.5]
@}

La función \cd{RoundUp[x]} implementa ${\cal R}_{-\infty}(x)$:
@o math/round.m
@{@%
RoundDn[x_] := Ceiling[x - 0.5]
@}

La función \cd{RoundZero[x]} implementa ${\cal R}_{0}(x)$:
@o math/round.m
@{@%
RoundZero[x_] := If[x < 0, RoundUp[x], RoundDn[x]]
@}

La función \cd{RoundInf[x]} implementa ${\cal R}(x)$:
@o math/round.m
@{@%
RoundInf[x_] := If[x < 0, RoundDn[x], RoundUp[x]]
@}

La función \cd{RoundOdd[x]} implementa ${\cal R}_1(x)$:
@o math/round.m
@{@%
RoundOdd[x_] := If[Floor[x]+0.5==x, 2Floor[(x-0.5)*0.5]+1,Floor[x+0.5]]
@}


Definiremos aquí también las subrutinas empleadas para generar las ilustraciones de este documento.

En primer lugar, una función \cd{Fplot} para generar el gráfico de una función entre
dos valores de su variable libre:

@o math/round.m
@{@%
Fplot[f_, x1_, x2_] := Plot[f[x], {x, x1, x2}]
@}

Y otra función \cd{Pplot} para marcar una serie de puntos discretos de esa función.
Los puntos se tomarán en los valores enteros entre \cd{x1} y \cd{x2}, pero desplazados en
una cantidad \cd{d}. De esta forma podremos marcar los puntos del conjunto $\mathcal{M}$, haciendo
\cd{d}$=1/2$.

@o math/round.m
@{@%
Pplot[f_, x1_, x2_, d_] := ListPlot[Table[{x + d, f[x + d]}, {x, x1, x2}]]
@}

Por último, la función \cd{ShowF} nos permitirá combinar ambos gráficos seleccionando un
tamaño adecuado para los puntos. Los argumentos de este procedimiento serán la función
\cd{f} a visualizar, los extremos para los valores de la función y los extremos y desplazamiento
para los puntos discretos.

@o math/round.m
@{@%
ShowF[f_, x1_, x2_, n1_, n2_, d_] := 
      Show[Fplot[f, x1, x2], Pplot[f, n1, n2, d], 
        Prolog -> AbsolutePointSize[5]]
@}

Los gráficos que aparecen en este documento han sido generados con las siguientes instrucciones:

\begin{itemize}
\item
Función $\lfloor x\rfloor$:
@o math/round.m
@{@%
ShowF[Floor, -3, 3.1, -3, 3, 0]
@}
\item
Función $\lceil x\rceil$:
@o math/round.m
@{@%
ShowF[Ceiling, -3.1, 3, -3, 3, 0]
@}
\item
Función ${\cal E}(x)$:
@o math/round.m
@{@%
ShowF[IntegerPart, -3.1, 3.1, -3, 3, 0]
@}
\item
Función ${\cal F}(x)$:
@o math/round.m
@{@%
ShowF[FractionalPart, -3.1, 3.2, -3, 3, 0]
@}
\item
Función ${\cal R}_{2}(x)$:
@o math/round.m
@{@%
ShowF[Round, -4.5, 4.5, -5, 4, 0.5]
@}
\item
Función ${\cal R}_{1}(x)$:
@o math/round.m
@{@%
ShowF[RoundOdd, -4.5, 4.5, -5, 4, 0.5]
@}
\item
Función ${\cal R}_{+\infty}(x)$:
@o math/round.m
@{@%
ShowF[RoundUp, -4.5, 4.5, -5, 4, 0.5]
@}
\item
Función ${\cal R}_{-\infty}(x)$:
@o math/round.m
@{@%
ShowF[RoundDn, -4.5, 4.5, -5, 4, 0.5]
@}
\item
Función ${\cal R}_{0}(x)$:
@o math/round.m
@{@%
ShowF[RoundZero, -4.5, 4.5, -5, 4, 0.5]
@}
\item
Función ${\cal R}(x)$:
@o math/round.m
@{@%
ShowF[RoundInf, -4.5, 4.5, -5, 4, 0.5]
@}
\end{itemize}

% -----------------------------------------------------------------------------------------------------
\subsection{RPL}

La versión de RPL referida aquí es la de las calculadoras de las series 48 y 49, que
tienen una función \cd{RND} con dos argumentos: el número a redondear y la precisión.
La serie 28 tenía una instrucción \cd{RND} con un único argumento (el número a redondear)
que redondeaba en base al modo numérico actual (\cd{STD}, \cd{FIX}, \cd{ENG}).

Incluiremos los programas de RPL descritos aquí en un directorio:
@o round.rpl
@{@%
%%HP: T(3)A(D)F(.);
DIR
@<Objetos RPL@>
END
@}

Este primer programa calcula el redondeo ${\cal R}_2(x)
=\left\{ \begin{array}{cc}                       
        2\lfloor{\frac{x+{1/2}}{2}}\rfloor & \mbox{si $x\in\mathcal{M}$} \\
         \lfloor{x+{1/2}}\rfloor & \mbox{si $x\not\in\mathcal{M}$}
                     \end{array}
             \right.$

@d Objetos RPL
@{@%
RNDI0
\<<
  .5 +
  IF DUP FP 0 == THEN
    .5 * FLOOR 2 *
  ELSE
    FLOOR
  END
\>>
@}

% Nota: he encontrado esta implementación distinta del mismo redondeo
% que escribí a principios de 1994: ocupa 73 bytes frente a los 71 de la anterior
% y emplea un algoritmo distinto al que he deducido aquí, por lo que no lo
% incluiré en la documentación. Es parte del programa ROUND del directorio HOME
% que incorpora además el programa RNDI de más abajo
%
%  .5 + DUP FLOOR
%  IF SWAP OVER == THEN
%   IF DUP 2 MOD THEN
%      1 -
%    END
%  END


Si queremos redondear a un número de dígitos dado, podemos emplear
el siguiente programa, introduciendo en la pila en primer lugar el 
número a redondear y en segundo lugar el número de decimales.

@d Objetos RPL
@{@%
RNDIN
\<<
  ALOG SWAP OVER *
  RNDI0
  SWAP /
\>>
@}

La instrucción \cd{RND} de RPL puede redondear además con un número dado
de dígitos de \emph{precisión}, en lugar de dígitos \emph{decimales}.
Esto lo hace cuando el número de dígitos establecido es negativo.
Realizaremos un programa \cd{RNDI} que haga lo mismo, pero con el
redondeo ${\cal R}_2$.

@d Objetos RPL
@{@%
RNDI
\<<
  IF DUP 0 < THEN
    NEG OVER ABS LOG FLOOR 1 + -
  END
  ALOG SWAP OVER *
  RNDI0
  SWAP /
\>>
@}

Las calculadoras RPL (HP28, HP48 y HP49) redondean internamente los resultados de las
operaciones aritméticas en coma flotante mediante 
  ${\cal R}^{12}_2(x)$  (a 12 dígitos significativos). 
%Podemos redondear un número positivo así:
%  $x>0\Rightarrow{\cal R}_2(x)=$\cd{X 1E11 + 1E11 -}
El siguiente programa usa esta característica para implementar ${\cal R}_{2,n}(x)$

\begin{verbatim}
\<< 
    11 SWAP - ALOG     OVER SIGN *     DUP ROT + SWAP -
\>>
\end{verbatim}


Por último, este programa reproduce la función \cd{RND} de HP48 y HP49, y puede
ser útil como comando unificado que también funciona en HP28.

@o round28.rpl
@{@%
%%HP: T(3)A(D)F(.);
ROUND
\<<
  IF DUP 0 < THEN
    NEG OVER ABS LOG FLOOR 1 + -
  END
  ALOG SWAP OVER *
    IF DUP 0 < THEN
      .5 - CEIL
    ELSE
      .5 + FLOOR
    END
  SWAP /
\>>
@}

\subsubsection{Redondeo interno en calculadoras HP}

% -----------------------------------------------------------------------------------------------------

Las calculadoras de 10 dígitos como la HP-35, HP-15c, HP-16c usan un redondeo
intero del tipo ${\cal R}(x)$. En este ejemplo el número $1000000000.5$ se
redondea a $1000000001$:
\begin{verbatim}
  1 EEX 9 0.5 +  ->  1000000001 
\end{verbatim}

La representación en pantalla en los modos FIX, SCI, ENG cuandor requiere
redondeo utiliza también una función del tipo ${\cal R_n}(x)$.
En el caso de la función RND de la 15c se utiliza el mismo redondeo usado
en la visualización.

Las calculadoras HP de 12 dígitos,
como la HP-71B, las series 28, 48, 49, 50 (RPL), las 32s, 42s (RPL internamente)
o las 33s, 35s, usan 
un redondeo interno ${\cal R}_{2}(x)$ de forma que $100000000000.5$ se redondea
a $100000000000$ y $100000000001.5$ a $100000000002$:
\begin{verbatim}
  1 EEX 11 0.5 +      -> 100000000000 
  1 EEX 11 1 + 0.5 +  -> 100000000002
\end{verbatim}

Pero en estas mismas calculadoras el redondeo usado para los modod de 
visualización FIX, SCI, ENG y para la función RND es del tipo ${{\cal R}_n}(x)$.

Las calculadoras de las series 48 y 49 usan internamente números de 15 dígitos
({\em reales extendidos})
que no son redondeados sino truncados (además el resultado de algunas funciones
internas es inexacto hasta en los dos últimos dígitos).
Los resultados finales se convierten al formato normal ({\em real})
de 12 dígitos mediante redondeo ${\cal R}_2$.

Los números de precisión extendida pueden emplearse
programando en SysRPL o mediante la biblioteca XREAL (1005).
Estos números son útiles para realizar cálculos y almacenar los resultados
intermedios, de forma similar a los registros de 80 bits de la implementación
de coma flotante IEEE de los procesadores INTEL.
Por ejemplo podríamos programar una función para logaritmos en base
arbitraria usando XREAL así:
\begin{verbatim}
  \<< R~X SWAP R~X XLN SWAP XLN XDIV R~X \>>
\end{verbatim}
Obteniendo una mayor precisión que mediante su
equivalente \verb|LN SWAP LN SWAP /|.

La calculador aHP-15C cuenta con las operaciones:
\begin{itemize}
\item\cd{x INT }$={\cal E}(x)$
\item\cd{x FRAC}$={\cal F}(x)$
\item\cd{x RND}$={{\cal R}_n}(x)$ con $n$ según el modo
de visualización actual. % FIX n / SCI m /ENG ... (m signif.)
\end{itemize}

La calculadora HP-35s tiene estas operaciones:
\begin{itemize}
\item\cd{x IP }$={\cal E}(x)$
\item\cd{x FP}$={\cal F}(x)$
 \item\cd{x RND}$={{\cal R}_n}(x)$ con $n$ según el modo
de visualización actual (notar que internamente en cambio se usa el redondeo ${\cal R}_{2,15}(x)$)
\end{itemize}


\subsubsection{LONGFLOAT}

También hay disponible una biblioteca para las serie 49, LONGFLOAT (902),
que trabaja con números de precisión arbitraria 
(fijada por una variable \verb|DIGITS|).
Un número $x$ se representa
mediante un exponente decimal y una {\em mantisa} entera de 
$d={\tt DIGITS}$ digitos cuyo valor $y$ es:
\[
y = 10^d \frac{x}{10^{\lfloor{\log{|x|}}\rfloor+1}}
\]
Se cuenta con cuatro modos de ``redondeo'' que se aplican a $y$
en función del estado de los indicadores 37 y 38 del sistema
y son similares a las especificadas en IEEE 754:

\begin{itemize}
\item ``al más cercano'' (${\cal R}(y)$): \verb|-37 CF -38 CF|
\item ``hacia abajo'' ($\lfloor y\rfloor$): {\ttfamily -37 SF -38 CF}
\item ``hacia arriba'' ($\lceil y\rceil$): {\ttfamily -37 CF -38 SF}
\item ``truncado'' hacia cero ${\cal E}(y)$: {\ttfamily -37 SF -38 SF}
\end{itemize}
Pero este ``redondeo'' se hace teniendo únicamente en cuenta el dígito
siguiente al dígito redondeado, por lo que sólo se realiza correctamente
en el primer caso (${\cal R}(y)$).
% 42 CF -37 CF -38 SF 5 'DIGITS' STO
% 1E4 R<-->F 0.01 R<-->F FADD -> 1E4
% última versión comprobada: 3.89 2006-07-10
% nueva comprobación: 3.90, 3.93 2006-12-30
% la biblioteca decMatrix (v.02) del mismo autor complementa LONGFLOAT
% realizando cálculas a alta velocidad con decNumber compilada en hpgcc
% (para HP-49g+/50G) y usa el redondeo ${\cal R}(y)$ (aunque LONGFLOAT
% use redondeo a par)

La versión 3.5 cambia el redondeo ``al más cercano'' por redondeo
a ``par'' ${\cal R}_{2}(x)$; se sigue usando únicamente un dígito adicional.
La versión 3.93 se distribuye en dos opciones, ${\cal R}(y)$ y ${\cal R}_{2}(x)$,
esta última con el defecto mencionado.
% 42 CF -37 CF -38 CF 5 'DIGITS' STO
% 1E4 R<-->F 0.51 R<-->F FADD -> 1E4


\pagebreak
% =====================================================================================================

\section{Otros lenguajes y sistemas}


% -----------------------------------------------------------------------------------------------------
\subsection{SQL}

El lenguaje Transact-SQL, o T-SQL es la versión de SQL implementada por Microsoft SQL Server 
(originalmente Sybase). Estas funciones no están en el estándar de SQL. % and in SQL2003?

\begin{itemize}
 \item\cd{FLOOR(x)}$=\lfloor x\rfloor$
 \item\cd{CEILING(x)}$=\lceil x\rceil$
 \item\cd{ROUND(x,n)=ROUND(x,n,0)}$={{\cal R}(10^n x)}/{10^n}$
 \item\cd{ROUND(x,n,1)}$={{\cal E}(10^n x)}/{10^n}$ (el tercer parámetro indica truncamiento)
\end{itemize}

Los dialectos SQL de PostgreSQL, MySQL y Oracle % Firebird/Interbase? DB2? SQLite? MS Jet/ADO ?
tienen estas mismas funciones, excepto la versión de \cd{ROUND} de
tres parámetros. 
Además la función \cd{CEILING} anterior se puede usar con la denominación \cd{CEIL}.


% -----------------------------------------------------------------------------------------------------
\subsection{MapBasic}

El lenguaje MapBasic es el lenguaje del sistema MapInfo.

\begin{itemize}
 \item\cd{Int(x)}$=\lfloor x\rfloor$
 \item\cd{Fix(x)}$={\cal E}(x)$
 \item\cd{Round(x,y)}
 \(=\left\{ \begin{array}{cc}
          y{\cal R}_{+\infty}(x/y) & \mbox{si $y\neq 0$} \\
          x & \mbox{si $y=0$}
        \end{array}
 \right.\)
\end{itemize}

% -----------------------------------------------------------------------------------------------------
\subsection{Excel}

Aquí nos referimos al lenguaje de fórmulas de Microsoft Excel, no al lenguaje de macros
que incorpora, VBA (Visual Basic for Applications). 

Los nombres de las funciones son distintos en versiones de Excel para diferentes idiomas. Se muestran
los nombres en ingés y castellano.

\begin{itemize}
\item \cd{ROUND(x,n)}$\equiv$\cd{REDONDEAR(x,n)} $={\cal R}_{n}(x)$ 
\item \cd{ROUNDUP(x,n)}$\equiv$\cd{REDONDEAR.MAS(x,n)}
 \(=\left\{ \begin{array}{cc}
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\)
\item \cd{ROUNDDOWN(x,n)}$\equiv$\cd{REDONDEAR.MENOS(x,n)} 
 \(={{\cal E}(10^n x)}/{10^n}=\left\{ \begin{array}{cc}
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\)
\item \cd{EVEN(x)}$\equiv$\cd{REDONDEA.PAR(x)}$=$\cd{2*ROUNDUP(x/2,0)}
 \(=\left\{ \begin{array}{cc}
          2{\lceil{x/2}\rceil} & \mbox{si $x\geqslant 0$} \\
          2{\lfloor{x/2}\rfloor} & \mbox{si $x<0$}
        \end{array}
 \right.\)
\item \cd{ODD(x)}$\equiv$\cd{REDONDEA.IMPAR(x)}
 \(=\left\{ \begin{array}{cc}
          2{\lceil{{(x+1)}/2}\rceil}-1 & \mbox{si $x\geqslant 0$} \\
          2{\lfloor{{(x-1)}/2}\rfloor}+1 & \mbox{si $x<0$}
        \end{array}
 \right.\)
\item \cd{INT(x)}$\equiv$\cd{ENTERO(x)}$=\lfloor x\rfloor$
\item \cd{TRUNC(x,n)}$\equiv$\cd{TRUNCAR(x,n)}$=$\cd{ROUNDDOWN(x,n)}
\item \cd{FLOOR(x,y)}$\equiv$\cd{MULTIPLO.INFERIOR(x,y)}$=y{\lfloor(x/y)\rfloor}$
\item \cd{CEILING(x,y)}$\equiv$\cd{MULTIPLO.SUPERIOR(x,y)}$=y{\lceil(x/y)\rceil}$
\item \cd{MROUND(x,y)}$\equiv$\cd{REDOND.MULT(x,y)}$=$\cd{y*ROUND(x/y,0)}$=y{\cal R}(x/y)$
\end{itemize}

Excel introduce tres funciones cuya forma no ha sido mostrada
en la primera sección de este documento:

\begin{figure}[!htbp]
\begin{center}
\begin{tabular}{ccc}
\includegraphics[height=3cm]{fig/xlrup.eps} & \includegraphics[height=3cm]{fig/xlreven.eps} & \includegraphics[height=3cm]{fig/xlrodd.eps} \\
\cd{ROUNDUP(x,0)} & \cd{EVEN(x)} & \cd{ODD(x)}
\end{tabular}
\end{center}
\end{figure}



% -----------------------------------------------------------------------------------------------------
\subsection{PHP}

\begin{itemize}
\item\cd{floor(x)}$=\lfloor x\rfloor$ 
\item\cd{ceil(x)}$=\lceil x\rceil$ 
\item\cd{round(x,n)}=$={\cal R}_{n}(x)$ ---a partir de la versión 4
\item\cd{round(x)=round(x,0)}$={\cal R}(x)$
\end{itemize}

% -----------------------------------------------------------------------------------------------------
\subsection{MatLab}

\begin{itemize}
\item\cd{floor(x)}$=\lfloor x\rfloor$ 
\item\cd{ceil(x)}$=\lceil x\rceil$ 
\item\cd{fix(x)}$={\cal E}(x)$
\item\cd{round(x)}$={\cal R}(x)$ --sin verificar; podría ser ${\cal R}_2$
\end{itemize}

% -----------------------------------------------------------------------------------------------------
\subsection{MathCAD}

\begin{itemize}
\item\cd{round(x,n)}$={\cal R}_n(x)$ ---en algunas versiones, (e.g. 8.00-8-02), ${\cal R}_{2,n}(x)$
\item\cd{round(x)=round(x,0)}
\item\cd{floor(x)}$=\lfloor x\rfloor$ 
\item\cd{ceil(x)}$=\lceil x\rceil$ 
\item\cd{trunc(x)}$={\cal E}(x)$ 
\item\cd{mantissa(x)=x-floor(x)}
\item\cd{round(x)=round(x,0)}$={\cal R}(x)$
\end{itemize}

% -----------------------------------------------------------------------------------------------------
\subsection{Maple}

\begin{itemize}
\item\cd{floor(x)}$=\lfloor x\rfloor$ 
\item\cd{ceil(x)}$=\lceil x\rceil$ 
\item\cd{trunc(x)}$={\cal E}(x)$ 
\item\cd{frac(x)}$={\cal F}(x)$
\item\cd{round(x)}$={\cal R}(x)$
\end{itemize}

% -----------------------------------------------------------------------------------------------------
%\subsection{Macsyma}
% [x]$=\lfloor x\rfloor$

% -----------------------------------------------------------------------------------------------------
\subsection{Scheme}
\begin{itemize}
\item\cd{(round x)}$={\cal R}_2(x)$ ---algunas implementaciones no estándar, como KSM, usan ${\cal R}(x)$
\item\cd{(floor x)}$=\lfloor x\rfloor$
\item\cd{(ceiling x)}$=\lceil x\rceil$ 
\item\cd{(truncate x)}$={\cal E}(x)$ 
\end{itemize}

\subsubsection{Common Lisp}
De forma similar a como ocurre en Fortran con el prefijo \cd{A},
(\cd{AINT},\cd{ANINT} vs. \cd{INT},\cd{NINT}), 
Las siguientes funciones con el prefijo \cd{f} devuelven valores en coma flotante, mientras
que las funciones sin este prefijo devuelven valores de tipo entero.

\begin{itemize}
\item\cd{(fround x)}$={\cal R}(x)$ ---sin verificar
\item\cd{(ffloor x)}$=\lfloor x\rfloor$
\item\cd{(fceiling x)}$=\lceil x\rceil$ 
\item\cd{(ftruncate x)}$={\cal E}(x)$
\end{itemize}

% -----------------------------------------------------------------------------------------------------
\subsection{Perl}
\begin{itemize}
\item\cd{int(x)}$={\cal E}(x)$
\end{itemize}

Podemos emplear calcular ${\cal R}(x)$=\c{int(x+.5*(x<=>0))}.
Por ejemplo:

@o round.perl
@{@%
sub round {
    my($number) = shift;
    return int($number + .5 * ($number <=> 0));
}
@}

A partir de la versión 5, se incluye un módulo POSIX que contiene las funciones:
\begin{itemize}
\item\cd{floor(x)}$=\lfloor x\rfloor$ 
\item\cd{ceil(x)}$=\lceil x\rceil$ 
\end{itemize}

% -----------------------------------------------------------------------------------------------------
\subsection{IEEE 754}

El estándard de coma flotante IEEE 754 especifica 4 modos de `redondeo'
que son útiles para acotación de errores, comprobación de la estabilidad
de los cálculos, implementación de aritmética de intervalos, etc.
Estos redondeos (de los cuales sólo el modo por defecto es un redondeo
en el sentido definido aquí de ajuste al valor más cercano y los otros
se denominan redondeos orientados ---{\em directed}) se aplican
al dígito menos significativo de los resultados de operaciones aritméticas
que se calculan internamente con mayor precisión.

Los modos definidos por el estándar, para una base $b$ arbitraria 
(en IEEE 754 $b=2$) y $n$ como posición del dígito menos significativo,
son:
\begin{itemize}
\item {\em round to nearest}: ${\cal R}^b_{2,n}(x)$ ({\em round to even})
\item  {\em round toward $+\infty$}: ${\lceil {x b^n} \rceil /{b^n}}$  ({\em round up})
\item  {\em round toward $-\infty$}: ${\lfloor {x b^n} \rfloor /{b^n}}$  ({\em round down})
\item  {\em round toward $0$}: ${{\cal E}{x b^n}}/{b^n}$  ({\em truncate})
\end{itemize}
 
 

\subsubsection{IEEE 754-2008}
La revisión del estándar especifica otros nombres para los modos de redondeo
y se añade un nuevo modo de redondeo.
\begin{itemize}
\item {\em roundTiesToEven}: ${\cal R}^b_{2,n}(x)$
\item {\em roundTiesToAway}: ${\cal R}^b_{n}(x)={\cal R}^b_{\infty,n}(x)$
\item  {\em roundTowardPositive}: ${\lceil {x b^n} \rceil /{b^n}}$ 
\item  {\em roundTowardNegative}: ${\lfloor {x b^n} \rfloor /{b^n}}$
\item  {\em roundTowardZero}: ${{\cal E}{x b^n}}/{b^n}$
\end{itemize}






% -----------------------------------------------------------------------------------------------------
\subsection{Coprocesadores numéricos Intel}
Los procesadores 8087, 80287,i387, i486, Pentium, etc.,
se ajustan a las normas de coma flotante IEEE 
y realizan un redondeo en el bit menos significativo en las operaciones
aritméticas controlado por los
bits 10 y 11 de la \emph{palabra de control} del coprocesador:

\begin{itemize}
\item \cd{00}  ({\em round to nearest}): ${\cal R}^b_{2,n}(x)$ 
\item \cd{01}  ({\em round toward $-\infty$}): ${\lfloor {x b^n} \rfloor /{b^n}}$
\item \cd{10}  ({\em round toward $+\infty$}): ${\lceil {x b^n} \rceil /{b^n}}$
\item  \cd{11} ({\em round toward $0$}): ${{\cal E}{x b^n}}/{b^n}$
\end{itemize}

La instrucción \cd{FRNDINT} converte un valor a entero en función
del modo de redondeo:

\begin{itemize}
\item modo \cd{00} ({\em round to nearest}) $\rightarrow{\cal R}_2(x)$ 
\item modo \cd{01} ({\em round toward $-\infty$}) $\rightarrow\lfloor x\rfloor$
\item modo \cd{10} ({\em round toward $+\infty$}) $\rightarrow\lceil x\rceil$
\item modo \cd{11} ({\em round toward $0$} $\rightarrow{\cal E}(x)$
\end{itemize}

% -----------------------------------------------------------------------------------------------------
\subsection{C/C++}

\subsubsection{C99}
Las bibliotecas de C99 incluyen control del método de redondeo en \verb|<fenv.h>|
acordes al estándar IEEE
y funciones de redondeo en \verb|<tgmath.h>| y \verb|<math.h>|.

\begin{itemize}
\item \cd{fsetround(FE\_DOWNWARD);}$\Rightarrow$\cd{nearbyint(x)}$=$\cd{rint(x)}$=\lfloor x\rfloor$
\item \cd{fsetround(FE\_UPWARD);}$\Rightarrow$\cd{nearbyint(x)}$=$\cd{rint(x)}$=\lceil x\rceil$
\item \cd{fsetround(FE\_TONEAREST);}$\Rightarrow$\cd{nearbyint(x)}$=$\cd{rint(x)}$={\cal R}_2(x)$
\item \cd{fsetround(FE\_TOWARDZERO);}$\Rightarrow$\cd{nearbyint(x)}$=$\cd{rint(x)}$={\cal E}(x)$
\item \cd{round(x)}$={\cal R}(x)$
\item \cd{trunc(x)}$={\cal E}(x)$
\end{itemize}

\subsubsection{C90}
En C90 (C89), hay un valor definido en \verb|<float.h>| que indica el modo de redondeo para
la suma en coma flotante:

\begin{itemize}
\item \cd{FLT\_ROUNDS}$\equiv$\cd{-1}$\rightarrow$ (indeterminado)
\item \cd{FLT\_ROUNDS}$\equiv$\cd{0}$\rightarrow {\cal E}(x)$
\item \cd{FLT\_ROUNDS}$\equiv$\cd{1}$\rightarrow {\cal R}(x)$ (o bien otro redondeo al entero más cercano)
\item \cd{FLT\_ROUNDS}$\equiv$\cd{2}$\rightarrow \lceil x\rceil$
\item \cd{FLT\_ROUNDS}$\equiv$\cd{3}$\rightarrow \lfloor x\rfloor$
\end{itemize}

\subsubsection{C++}
En C++, este mismo valor está definido en \verb|<limits>|, en \verb|std::numeric_limits<...>::round_style|

\begin{itemize}
\item \cd{std::round\_indeterminable}$\equiv$\cd{-1}$\rightarrow$ (indeterminado)
\item \cd{std::round\_toward\_zero}$\equiv$\cd{0}$\rightarrow {\cal E}(x)$
\item \cd{std::round\_to\_nearest}$\equiv$\cd{1}$\rightarrow {\cal R}(x)$ (u otro redondeo)
\item \cd{td::round\_toward\_infinity}$\equiv$\cd{2}$\rightarrow \lceil x\rceil$
\item \cd{std::round\_toward\_neg\_infinity}$\equiv$\cd{3}$\rightarrow \lfloor x\rfloor$
\end{itemize}



% -----------------------------------------------------------------------------------------------------

% JavaScript: con decimales
% mine:
%function Round(v,dec)
%{
%  var sc = Math.pow(10,dec);
%  return Math.round(v*sc)/sc;
%}
% other's:
%function roundit(Num, Places) {
%   if (Places > 0) {
%      if ((Num.toString().length - Num.toString().lastIndexOf('.')) > (Places + 1)) {
%         var Rounder = Math.pow(10, Places);
%         return Math.round(Num * Rounder) / Rounder;
%      }
%      else return Num;
%   }
%   else return Math.round(Num);
%}

% Object Pascal (Borland Pascal, Delphi, Kylix)
%  originaly (before Delphi) Round(x) was ${\cal R}(x)$

% Magik...

% Tcl

% SPSS

% -----------------------------------------------------------------------------------------------------
\subsection{General Decimal Arithmetic Specification}
Existe un {\em contexto} que contiene parámetros y reglas que afectan a los resultados
de las operaciones. Uno de los parámetros es el modo de redondeo ({\em rounding})
que indica el algoritmo que se usa para ajustar la precisión de los resultados,
y que puede tomar los siguiente valores:
\begin{itemize}
\item {\em round-half-even}$={\cal R}_{2,n}(x)$ ({em round to nearest, ties to even})
\item {\em round-half-up}$={\cal R}_n(x)={\cal R}_{\infty,n}(x)$ ({\em round to nearest, ties away from zero})
\item {\em round-half-down}$={\cal R}_{0,n}(x)$ )  opcional 
\item {\em round-up}
 \(=\left\{ \begin{array}{cc}
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\) {\em round away from zero} opcional
\item {\em round-down}
 \(={{\cal E}(10^n x)}/{10^n}=\left\{ \begin{array}{cc}
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\) ({\em round toward zero}, {\em truncate})
\item {\em round-ceiling}$={\lceil 10^n x\rceil}/{10^n}$ ({\em round toward $+\infty$})
\item {\em round-floor}$={\lfloor 10^n x\rfloor}/{10^n}$ ({\em round toward $-\infty$})

\item {\em round-05up}
\(=\left\{ \begin{array}{cc}
          \mbox{\em round-up} & \mbox{si ${{10^n x} \bmod 10}$ es $0$ ó $5$ } \\
          \mbox{\em round-down} & \mbox{si ${{10^n x} \bmod 10}$ distinto de $0$ y $5$}
        \end{array}
 \right.\) 
\end{itemize}

La especificación define una función para aplicar el redondeo definido por el contexto;
por ejemplo si el redondeo es {\em round-half-up}:
${\textstyle quantize}(x,y)={\cal R}_n(x)$ con $n$ igual al exponente de y; si y es normalizado
se tiene $n=\lfloor{log_{10} y}\rfloor$.
Lo habitual es emplear potencias de 10 para $y$:
${\cal R}_n(x)={\textstyle quantize}({10}^{-n})$.

Inicialmente se había definido una función equivalente con otra forma de 
especificar el número de dígitos:
${\textstyle rescale}(x,n)={\cal R}_n(x)$

El redondeo {\em round-05up}, añadido posteriormente a los demás, está ideado para
obtener un resultado con un número fijo de dígitos con este modo y posteriormente
poder redondearlo a un número inferior de dígitos con cualquier otro modo de redondeo
obteniendo un resultado correctamente redondeado. Consiste en redondear usando 
{\em round-down} (${\cal E}$),
excepto si el dígito redondeado es 0 ó 5, en cuyo caso se redondea `` hacia arriba''
usando {\em round-up}.

para
realizar un cálculo usándolo para obtener un resultado con un número suficiente de
dígitos y luego poderlo redondear a un número inferior de dígitos con cualquier otro
modo de redondeo obteniendo un resultado correcto.

% implementaciones:
%    DecNumber C libray
%    Java BigDecimal


% -----------------------------------------------------------------------------------------------------
\subsection{Ruby BigDecimal}

La clase \cd{BigDecimal} (incluida con Ruby, versión 1.8 y posteriores)
tiene varios métodos y opciones de redondeo.

\begin{itemize}
\item \cd{x.round(n,BigDecimal::ROUND\_HALF\_UP)}$={\cal R}_n(x)$
\item \cd{x.round(n,BigDecimal::ROUND\_HALF\_EVEN)}$={\cal R}_{2,n}(x)$
\end{itemize}

El modo de redondeo \cd{ROUND\_HALF\_DOWN} es una versión defectuosa de
${\cal R}_0$, ya que sólo se tiene en cuenta el dígito siguiente al dígito
redondeado (entendiendo por tal el dígito menos significativo mostrado
después del redondeo, que puede haber sido ajustado).
Si el dígito a redondear es 5 (o inferior), se redondea el valor hacia cero,
aunque haya otros dígitos no nulos detrás de él. Si el dígito es 6 (o superior)
se redondea hacia infinito.

% también los otros redondeos como CEILING son defectuosos porque sólo
% se considera un grupo de 4 dígitos mas allá del punto de redondeo


Nota: en las últimas pruebas con Ruby 1.8.6, también \cd{ROUND\_HALF\_EVEN} presenta
este comportamiento anómalo.

Los siguientes modos de redondeo no son propiamente redondeos, 
corresponden a los modos del estándar IEEE y permiten la implementación de aritmética
de intervalos;
(las funciones tercera y cuarta corresponden a \cd{ROUNDUP} y \cd{ROUNDDOWN} de Excel.

\begin{itemize}
\item \cd{x.round(n,BigDecimal::ROUND\_CEILING)}$=$\cd{x.ceil(n)}$={\lceil 10^n x\rceil}/{10^n}$
\item \cd{x.round(n,BigDecimal::ROUND\_FLOOR)}$=$\cd{x.floor(n)}$={\lfloor 10^n x\rfloor}/{10^n}$
\item \cd{x.round(n,BigDecimal::ROUND\_UP)}
 \(=\left\{ \begin{array}{cc}
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\)
\item \cd{x.round(n,BigDecimal::ROUND\_DOWN)}
 \(={{\cal E}(10^n x)}/{10^n}=\left\{ \begin{array}{cc}
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\)
\end{itemize}


Como hemos visto, las funciones \cd{floor}, \cd{ceil} también admiten un parámetro
opcional (con valor 0 por omisión) para especificar el dígito sobre el que se opera.

El modo de redondeo por omisión se puede establecer con \cd{BigDecimal::mode};
el valor inicial por omisión es \cd{ROUND\_HALF\_UP} (${\cal R}$).


\begin{verbatim}
  BigDecimal::mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_UP) 
  BigDecimal::mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_DOWN) 
  BigDecimal::mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_HALF_UP) 
  BigDecimal::mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_HALF_DOWN) 
  BigDecimal::mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_HALF_EVEN) 
  BigDecimal::mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_CEILING) 
  BigDecimal::mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_FLOOR) 
\end{verbatim}

Este modo de redondeo se usa también para el redondeo interno, el que ocurre
por ejemplo en la expresión:
\begin{verbatim}
  BigDecimal('.1E15').add(BigDecimal('0.5'),15)
\end{verbatim}

La posición decimal a redondear es también opcional; el valor por omisión es 0. 
Si el modo de redondeo por omisión inicial no se ha modificado, tedremos que:
\begin{itemize}
\item \cd{x.round}$={\cal R}(x)$
\end{itemize}

Otros métodos:

\begin{itemize}
\item \cd{x.fix}$={\cal E}(x)$
\item \cd{x.frac}$={\cal F}(x)$
\item \cd{x.truncate}$={\cal E}(x)$
\item \cd{x.truncate(n)}$={{\cal E}(10^n x)}/{10^n}$
\end{itemize}

Nota: \cd{to\_i} da el mismo resultado que \cd{fix}, pero en forma de número entero (\cd{Integer})
en lugar de \cd{BigDecimal}.

\subsection{Python Decimal}

El tipo Decimal de Python está regido por la {\em General Decimal Arithmetic Specification}.

Los modos de redondeo (asignados por ejemplo mediante \verb|getcontext().rounding=ROUND_HALF_EVEN|
son los siguientes:


\begin{itemize}
\item \cd{ROUND\_CEILING}$=$\cd{x.ceil(n)}$={\lceil 10^n x\rceil}/{10^n}$ 
\item \cd{ROUND\_DOWN}
 \(={{\cal E}(10^n x)}/{10^n}=\left\{ \begin{array}{cc}
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\)
\item \cd{ROUND\_FLOOR}$=$\cd{x.floor(n)}$={\lfloor 10^n x\rfloor}/{10^n}$
\item \cd{ROUND\_HALF\_UP)}$={\cal R}_n(x)$
\item \cd{ROUND\_HALF\_EVEN}$={\cal R}_{2,n}(x)$
\item \cd{ROUND\_HALF\_DOWN}$={\cal R}_{0,n}(x)$
\item \cd{ROUND\_UP}
 \(=\left\{ \begin{array}{cc}
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\)

\end{itemize}

El contexto aritmético contiene además del modo de redondeo y otros parámetros
la precisión (número de decimales) de las operaciones y conversiones.
Los modos de redondeo se utilizan en todas las operaciones, de forma que el resultado
equivale a realizar la operación de forma exacta y después redondearlo mediante
el modo y precisión establecidos en el contexto.
El modo de redondeo no se emplean también en la conversión de literales de texto
a números.


El modo de redondeo inicial por omisión es \cd{ROUND\_HALF\_EVEN} (${\cal R}_2$)
y la precisión 28.


Hay una función genérica de redondeo, \cd{quantize} que se puede usar con
cualquiera de los modos:
\par
\verb|x.quantize(y, rounding=ROUND_HALF_EVEN)|$={\cal R}_{2,n}$
con \verb|y=Decimal(10)**(-n)| ($y=10^n$) o, con más generalidad
\verb|n=y.as_tuple()[2]| ($n$ es el exponente de \cd{y}). Si \cd{y} es un
valor normalizado, entonced $n=\lfloor{log_{10} y}\rfloor$.





% TO DO : Perl BigNum BigFloat ?

\end{document}
