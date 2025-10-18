import { useState, useEffect } from "react";

export default function ApiData() {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch("https://api.publicapis.org/entries")
      .then(res => res.json())
      .then(json => setData(json.entries));
  }, []);

  return (
    <div className="p-6">
      <h2 className="text-2xl font-bold mb-4">API Data</h2>
      <ul className="space-y-2">
        {data.slice(0, 5).map((item, index) => (
          <li key={index} className="bg-gray-100 p-2 rounded">
            {item.API} - {item.Description}
          </li>
        ))}
      </ul>
    </div>
  );
}
