# Компилятор
CC = g++

# Флаги компиляции
CFLAGS = -Wall -Wextra -std=c++20

# Исполняемый файл
EXEC = transport_catalogue

# Объектные файлы
OBJS = transport_catalogue.o input_reader.o stat_reader.o main.o

# Цель по умолчанию
all: $(EXEC)

# Как собирать исполняемый файл
$(EXEC): $(OBJS)
	$(CC) $(CFLAGS) -o $(EXEC) $(OBJS)

# Зависимости и правила для объектных файлов
transport_catalogue.o: transport_catalogue.cpp transport_catalogue.h geo.h
	$(CC) $(CFLAGS) -c transport_catalogue.cpp

input_reader.o: input_reader.cpp input_reader.h
	$(CC) $(CFLAGS) -c input_reader.cpp

stat_reader.o: stat_reader.cpp stat_reader.h
	$(CC) $(CFLAGS) -c stat_reader.cpp

main.o: main.cpp transport_catalogue.h input_reader.h stat_reader.h
	$(CC) $(CFLAGS) -c main.cpp

# Цель для очистки
clean:
	rm -f $(OBJS) $(EXEC)
