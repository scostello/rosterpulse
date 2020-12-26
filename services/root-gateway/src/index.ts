import { ApolloGateway } from '@apollo/gateway';
import { ApolloServer } from 'apollo-server';

const gateway = new ApolloGateway({
  serviceList: [
    { name: 'accounts', url: 'http://localhost:4001/query' },
    { name: 'products', url: 'http://localhost:4002/query' },
    { name: 'reviews', url: 'http://localhost:4003/query' }
  ],
});

const server = new ApolloServer({
  gateway,

  subscriptions: false,
});

server.listen().then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});
