lint:
	luacheck src

clean:
	rm *.so *.o

.PHONY: lint clean
