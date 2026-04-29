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

export type NoteResponse = {
    Id: number,
    Title: string
};

export const getTestPostgresData = async () => {
    try {
        const resp = await dancerApi.get('notes/1', {
            timeout: 5000, // 5 seconds
        });
        return resp.data;
    } catch (error) {
        return error;
    }
}