import { dancerApi } from "./const";

export const getTestDancerData = async () => {
    try {
        const resp = await dancerApi.get('/test', {
            timeout: 5000, // 5 seconds
        });
        return resp.data;
    } catch (error) {
        return error;
    }
}