import { ApolloGateway } from '@apollo/gateway';
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

server.listen().then(({ url }) => {
  console.log(`🚀 Server ready at ${url}!!`);
});
