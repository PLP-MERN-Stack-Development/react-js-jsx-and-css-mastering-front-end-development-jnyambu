export default function Home() {
  return (
    <>
      <div className="p-6">
        <h2 className="text-3xl font-bold mb-4">Welcome to My React App 🚀</h2>
        <p className="text-gray-700">This is the homepage.</p>
      </div>

      <div className="max-w-lg mx-auto p-4 bg-white rounded shadow hover:shadow-lg transition">
        <h3 className="text-xl font-semibold mb-2">Card Title</h3>
        <p className="text-gray-600">Card content goes here...</p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {/* content */}
      </div>
    </>
  );
}
