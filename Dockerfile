FROM        node:7-alpine
MAINTAINER  The MyBook Developers <dev@mybook.ru>

RUN addgroup slack_jira && adduser -D -G slack_jira slack_jira

COPY lib/ /slack_jira/lib/
COPY package.json /slack_jira/
COPY config-example.js /slack_jira/jirabot.js

RUN chown -R slack_jira:slack_jira /slack_jira
USER slack_jira
WORKDIR /slack_jira
RUN npm install

VOLUME [ "/slack_jira" ]

CMD [ "node", "jirabot" ]
