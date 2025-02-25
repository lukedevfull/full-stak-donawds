import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

const ProductsPage = () => {
  return (
    <div className="rounded-xl border border-red-500 p-5">
      <h1 className="text-red-500">ProductsPages</h1>
      <br />
      <Button>Isaque O Sujoo</Button>
      <br />
      <br />
      <Input placeholder="Bora cagar, Bill" />
    </div>
  );
};

export default ProductsPage;
