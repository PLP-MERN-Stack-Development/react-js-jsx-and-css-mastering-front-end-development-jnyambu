export default function Navbar() {
  return (
<nav className="bg-blue-600 text-white p-4 flex justify-between items-center">
      <h1 className="text-2xl font-bold">My React App</h1>
      <ul className="flex space-x-4">
        <li>Home</li>
        <li>About</li>
        <li>API Data</li>
      </ul>
    </nav>
  );
}
