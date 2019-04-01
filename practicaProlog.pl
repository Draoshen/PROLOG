zero.
nat(zero).

nat(s(N)):-nat(N).



igualdad(zero,zero).
igualdad(s(N),s(M)):-igualdad(A,B).

mayorOigual(_N,zero).
mayorOigual(zero,zero).
mayorOigual(s(A),s(B)):- mayorOigual(A,B).
