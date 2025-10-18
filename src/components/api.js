export async function fetchData() {
  const res = await fetch("https://api.publicapis.org/entries");
  const data = await res.json();
  return data.entries;
}
