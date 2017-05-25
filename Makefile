lint:
	luacheck src

clean:
	rm *.so *.o

spec:
	busted .

doc:
	ldoc -d docs .

.PHONY: lint clean spec doc
