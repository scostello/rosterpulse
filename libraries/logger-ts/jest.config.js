module.exports = {
  moduleFileExtensions: ['json', 'js', 'ts'],
  modulePaths: ['<rootDir>/src'],
  testEnvironment: 'node',
  transform: {
    "^.+\\.(js|ts)?$": 'ts-jest',
  },
};