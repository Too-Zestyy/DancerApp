<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { getTestDancerData, getTestPostgresData } from '@/api/test-endpoint';

// reactive state
const dancerTestValue = ref({});
const postgresTestValue = ref({});

// functions that mutate state and trigger updates

// lifecycle hooks
onMounted(async () => {
  dancerTestValue.value = await getTestDancerData();
  postgresTestValue.value = await getTestPostgresData();
})
</script>

<template>
    <h1>Dancer API Test</h1>
    <p>The Dancer API gave us... {{ dancerTestValue }}</p>
    <p>Dancer and postgres gave us... {{ postgresTestValue }}</p>
</template>

<style lang="scss" scoped>
h1 {
  color: red;
}
</style>