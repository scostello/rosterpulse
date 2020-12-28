import { ApolloGateway } from '@apollo/gateway';
import { createLogger } from '@rosterpulse/logger-ts';
import { ApolloServer } from 'apollo-server';

const gateway = new ApolloGateway({
  serviceList: [
    { name: 'accounts', url: 'http://accounts-gateway-dev:80/query' },
    { name: 'channels', url: 'http://channels-gateway-dev:80/query' },
    { name: 'documents', url: 'http://documents-gateway-dev:80/query' }
  ],
});

const server = new ApolloServer({
  gateway,
  playground: true,
  subscriptions: false,
});

const logger = createLogger({
  appID: 'root-gateway',
  appVersion: '0.1.0',
  schemaVersion: '1.0',
})

server.listen().then(({ url }) => {
  logger.info(`🚀 Server ready at ${url}!!`);
});
