import axios from 'axios';

export const createJwtToken = ({ ipphone, expired, secret_key }) => {
  return axios.post('/api/jwt-token', {
    ipphone,
    expired,
    secret_key,
  });
};

export const testAPI = () => {
  return axios.get('https://api.restful-api.dev/objects/7');
}