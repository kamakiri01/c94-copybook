DOCKER_COMPOSE = docker-compose
RM             = rm

TARGET = articles/book.pdf

.PHONY: all lint onlytex clean

all: $(TARGET)

$(TARGET):
	$(DOCKER_COMPOSE) up --abort-on-container-exit c94-copybook-compile

lint:
	$(DOCKER_COMPOSE) up --abort-on-container-exit c94-copybook-lint

onlytex:
	$(DOCKER_COMPOSE) up --abort-on-container-exit c94-copybook-onlytex

clean:
	$(RM) -rf $(TARGET)
