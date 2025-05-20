import axios from 'axios';

export const createJwtToken = (ipphone) => {
  return axios.post('/api/v1/jwt_token', {
    'ipphone': ipphone,
  });
};

export const testAPI = () => {
  return axios.get('https://api.restful-api.dev/objects/7');
}