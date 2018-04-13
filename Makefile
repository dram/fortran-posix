PROGRAM = tests/run-tests
MODULES_DIR = modules
OBJECT_FILES = sources/posix.o tests/main.o
CONSTANTS_FILE = sources/constants.f90
CONSTANTS_GENERATOR = sources/constants

.PHONY: build clean run setup

build: setup ${PROGRAM}

run: build
	@${PROGRAM}

sources/posix.o: sources/posix.f90 ${CONSTANTS_FILE}

${CONSTANTS_FILE}: ${CONSTANTS_GENERATOR}
	$^ >$@

${CONSTANTS_GENERATOR}: sources/constants.c
	${CC} -Wall -o $@ $^

%.o: %.f90
	${CC} -std=f2008 -Wall -J ${MODULES_DIR} -o $@ -c $<

${PROGRAM}: ${OBJECT_FILES}
	${CC} -o $@ $^ -lgfortran

setup: ${MODULES_DIR}

${MODULES_DIR}:
	mkdir -p $@

clean:
	rm -rf ${PROGRAM} ${OBJECT_FILES} ${MODULES_DIR}
	rm -rf ${CONSTANTS_GENERATOR} ${CONSTANTS_FILE}
