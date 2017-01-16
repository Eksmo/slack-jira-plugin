FROM        node:7-alpine
MAINTAINER  The MyBook Developers <dev@mybook.ru>

COPY lib/ /slack_jira/lib/
COPY package.json /slack_jira/
COPY config-example.js /slack_jira/jirabot.js

WORKDIR /slack_jira
RUN npm install

VOLUME [ "/slack_jira" ]

CMD [ "node", "jirabot" ]
