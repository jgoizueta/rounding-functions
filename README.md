# Rounding/Modulo operations

These are two documents created in 2001, using [nuweb](https://github.com/jgoizueta/nuweb) to generate the documents LaTeX source and some example code.

Note that the .w source files use the ISO-8859-1 encoding.

The final generated documents are in the `src` directory.

Summary of rounding modes table: [rounding_modes.html](rounding_modes.html).

## TODO

### Ruby updates

* Ruby 1.9 Float#round precision argument:
  + `\cd{x.round(n)}$={\cal R}_n(x)$`
* Ruby 2.4 Numeric#round #ceil #floor #truncate precision argument:
  + `\cd{x.ceil(n)}$={\lceil 10^n x\rceil}/{10^n}$`
  + `\cd{x.floor(n)}$={\lfloor 10^n x\rfloor}/{10^n}$`
  + `\cd{x.truncate(n)}$={\cal E}(10^n x)}/{10^n}$`
* Ruby 2.4 Numeric#round :half option:
  + `\cd{x.round(half: even)}$={\cal R}_2(x)$`
  + `\cd{x.round(n, half: even)}$={\cal R}_{2,n}(x)$`
  + `\cd{x.round(half: down)}$={\cal R}_0(x)$`
  + `\cd{x.round(n, half: down)}$={\cal R}_{0,n}(x)$`
  + `\cd{x.round(half: up)}$={\cal R}(x)$`
  + `\cd{x.round(n, half: up)}$={\cal R}_n(x)$`

### Flt

[Flt](https://github.com/jgoizueta/flt) rounding modes.

The [rounding modes](https://github.com/jgoizueta/flt/blob/v1.5.1/lib/flt/num.rb#L150-L157) of Flt are equivalent to those of General Decimal Arithmetic:

```latex
\begin{itemize}
\item {\em half_even}$={\cal R}_{2,n}(x)$ ({em round to nearest, ties to even})
\item {\em half_up}$={\cal R}_n(x)={\cal R}_{\infty,n}(x)$ ({\em round to nearest, ties away from zero})
\item {\em half_down}$={\cal R}_{0,n}(x)$ )  opcional 
\item {\em up}
 \(=\left\{ \begin{array}{cc}
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\) {\em round away from zero} opcional
\item {\em down}
 \(={{\cal E}(10^n x)}/{10^n}=\left\{ \begin{array}{cc}
          {\lfloor(10^n x)\rfloor}/{10^n} & \mbox{si $x\geqslant 0$} \\
          {\lceil(10^n x)\rceil}/{10^n} & \mbox{si $x<0$} 
        \end{array}
 \right.\) ({\em round toward zero}, {\em truncate})
\item {\em ceiling}$={\lceil 10^n x\rceil}/{10^n}$ ({\em round toward $+\infty$})
\item {\em floor}$={\lfloor 10^n x\rfloor}/{10^n}$ ({\em round toward $-\infty$})

\item {\em 05up}
\(=\left\{ \begin{array}{cc}
          \mbox{\em round-up} & \mbox{si ${{10^n x} \bmod 10}$ es $0$ ó $5$ } \\
          \mbox{\em round-down} & \mbox{si ${{10^n x} \bmod 10}$ distinto de $0$ y $5$}
        \end{array}
 \right.\) 
\end{itemize}
```

### Julia

[Julia](https://julialang.org/) rounding modes.

* Rounding modes: https://docs.julialang.org/en/stable/stdlib/math/#Base.RoundingMode
* Rounding functions: https://docs.julialang.org/en/stable/manual/mathematical-operations/#man-rounding-functions

Rounding modes correspondence: 

* default (`RoundNearest`) `round(x)` : `${\cal R}_{2}(x)$` (Flt/GDA: `:half_even`)
* `round(x, RoundNearestTiesAway)` : `${\cal R}(x)$` (Flt/GDA: `:half_up`)
* `round(x, RoundNearestTiesUp)` : `${\cal R}_{+\infty}(x)$`
* `round(x, RoundToZero)==trunc(x)` : `${\cal E}(x)$` (Flt/GDA: `:down`)
* `round(x, RoundUp)==ceil(x)` : `${\lceil x\rceil}$` (Flt/GDA: `:ceiling`)
* `round(x, RoundDown)==floor(x)` : `${\lfloor x\rfloor}$` (Flt/GDA: `:floor`)

For `BigFloat` and additional mode (corresponding to MPFR `MPFR_RNDA`) is available:

* `setrounding( ()->round(BigFloat(x)), BigFloat, RoundFromZero)` :

```
 \(=\left\{ \begin{array}{cc}
          {\lceil x\rceil} & \mbox{si $x\geqslant 0$} \\
          {\lfloor x\rfloor} & \mbox{si $x<0$} 
 \end{array}
```

This *round away from zero* mode is equivalent to GDA's `ROUND_UP`, Flt's `:up`, Excel's `ROUNDUP`, BigDecimal's `ROUND_UP`, Python's Decimal `ROUND_UP`.

So, Julia has one unique rounding mode without correspondence in GDA: `RoundNearestTiesUp`.

### MPFR

See http://www.mpfr.org/mpfr-current/mpfr.html#Rounding-Modes

### Numerical precision issues

#### Rounding surprises

Fist, let's look a specific case with Flt.

Unlike `Float#round` (or round in other Languages, such as Julia or Python) `Num#round argument` is the number of digits in the internal radix, so for `BinNum` it is the number of bits.

Also unlike Ruby Float or Julia (but like Python) when using `Numerals::Format` to round, the internal exact value is rounded, e.g. for IEEE binary 1.15 (which is actually < 1.15) we have:

```ruby
x = BinNum('1.15', :fixed)
Numerals::Format[precision: 2].write x # => 1.1

1.15.round(1) # => 1.2
```

Note that the result of 1.2 coincides with that of Julia, see http://docs.julialang.org/en/stable/stdlib/math/#Base.round

The R and Python languages, unlike Ruby or Julia are more strict:

R:

```r
round(1.15,1) # => 1.1
```


Python:

```
round(1.15,1) # => 1.1
```

In C:

```c
printf("%.1f", 1.15); /* => 1.1 */
```

In Python:

```python
"%.1f" % 1.15 # => 1.1
```

In Julia:

```julia
@sprintf "%.1f" 1.15 # => 1.1
```

But in Ruby:

```ruby
"%.1f" % 1.15 # => 1.2
```

In C++:

```cpp
std::cout << std::fixed << std::setprecision(1) << 1.15 << std::endl; // => 1.1
```

Notes:

```ruby
x.to_decimal_exact.round(1) # => 1.1
x.to_decimal.round(1) # => 1.2
Numerals::Conversions.convert(x, type: DecNum).round(1) # => 1.2
Numerals::Conversions.convert(x, type: DecNum, exact: true).round(1) # 1.1
Numerals::Rounding[precision: 2].round Numerals::Conversions.write(x) # 1.2 numeral
```

```ruby
setrounding(Float64,RoundToZero) do
    round(1.15,1) # 1.0999999999999999
end

setrounding(Float64,RoundToZero) do
    round(1.15,2) # 1.14
end

BinNum.context(rounding: :down) do
    BinNum('1.15',:fixed).round(2) # 1.3
end

setrounding(Float64,RoundNearestTiesUp) do
    round(1.15,1) # 1.0999999999999999
end
```

Note that in Ruby and any other language ``(1.15*10).round`` is 12, so rounding using arithmetic `(round(x*10^n)/10^n)` yields 1.2 in these cases

```ruby
BinNum.context =  BinNum::IEEEDoubleContext
x = BinNum('1.15',:fixed)
x.to_decimal_exact      # => DecNum('1.149999999999999911182158030')
(x*10).to_decimal_exact # => DecNum('11.5')
```

So the result 1.2 when rounding the binary floating point number 1.15 to two decimal digits could be due two any of two different reasons:

* Roundoff because of arithmetic involved in rounding (e.g. Julia uses this, ``round(x*og)/og``)
* It is the decimal, non exact representation which is rounded (double-rounding)

Oddly, the non-exact rounding is less surprising, at least for the case 1.15, because of the the internal value usually being represented as 1.15

So we have two common approaches:

* Exact (Python, R) see https://docs.python.org/2/library/functions.html#round
* Loose (Ruby, Julia) see http://docs.julialang.org/en/stable/stdlib/math/#Base.round

Some implementations:

Python rounding code: https://github.com/python/cpython/blob/6f0eb93183519024cb360162bdd81b9faec97ba6/Objects/floatobject.c#L915

Julia rounding code: https://github.com/JuliaLang/julia/blob/db7a995b10b32ff9cdf8481d177abe1cba16f903/base/floatfuncs.jl#L134

R code here: https://github.com/wch/r-source/blob/af7f52f70101960861e5d995d3a4bec010bc89e6/src/nmath/fround.c#L97
(doesn't seem to match results observed)

#### Modulo isues

See also, for modulo functions: http://stackoverflow.com/questions/4633177/c-how-to-wrap-a-float-to-the-interval-pi-pi


