
ASSN = 1
CLASS= compiladores-1-cunoc
CLASSDIR= ..
SRC= pila.cl README 
LSRC= Makefile atoi.cl pila.test

CC=gcc
CFLAGS=-g

.c.o:
	${CC} ${CFLAGS} -c $<

compile: pila.s

pila.s: pila.cl atoi.cl
	${CLASSDIR}/bin/coolc pila.cl atoi.cl 

test:	compile
	@echo pila.test
	${CLASSDIR}/bin/spim -file pila.s < pila.test

clean :
	rm -f *.s core *~
