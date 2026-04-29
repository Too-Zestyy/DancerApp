import axios from "axios";

// TODO: Replace this with prod API URL when deployed
const PROD_API_BASE_URL = "http://127.0.0.1:5000";

// Specify API url based on environment
const apiUrl = import.meta.env.PROD
  ? PROD_API_BASE_URL
  : "http://127.0.0.1:5000";

// export const BACK_END_HOST = 'http://127.0.0.1:5000';
export const BACK_END_API_ROOT = apiUrl + '/api';

export const dancerApi = axios.create({
  baseURL: BACK_END_API_ROOT,
  timeout: 5000,
});