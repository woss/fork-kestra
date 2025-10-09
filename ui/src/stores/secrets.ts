import axios from "axios";
import {defineStore} from "pinia";
import {apiUrl} from "override/utils/route";

export const useSecretsStore = defineStore("secrets", () => {
    async function find({page, size, query}: {page: number, size: number, query: string}) {
        const {data} = await axios.get(`${apiUrl()}/secrets`, {
            params: {
                page,
                size,
                ...(query === undefined ? {} : {
                        filters: {
                            q: {
                                EQUALS: query
                            }
                        }
                    }
                )

            }
        });

        return data;
    }

    return {find};
});
