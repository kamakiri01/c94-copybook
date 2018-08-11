DOCKER_COMPOSE = docker-compose
RM             = rm

TARGET = articles/book.pdf

.PHONY: all lint clean

all: $(TARGET)

$(TARGET):
	$(DOCKER_COMPOSE) up --abort-on-container-exit c94-copybook-compile

lint:
	$(DOCKER_COMPOSE) up --abort-on-container-exit c94-copybook-lint

clean:
	$(RM) -rf $(TARGET)
