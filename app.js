// Legacy order-export job. Runs on a single VM; deployed over SSH.
console.log(JSON.stringify({ exported: 0, at: new Date().toISOString() }));
