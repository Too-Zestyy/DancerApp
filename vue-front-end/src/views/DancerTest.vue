<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { getTestDancerData } from '@/api/test-endpoint';

// reactive state
const count = ref({});

// functions that mutate state and trigger updates

// lifecycle hooks
onMounted(async () => {
  count.value = await getTestDancerData();
})
</script>

<template>
    <h1>Dancer API Test (This is in a container!)</h1>
    <p>The Dancer API gave us... {{ count }}</p>
</template>