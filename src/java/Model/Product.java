package Model;

public class Product {
    private int ProductID;
    private String Name;
    private String Description;
    private int Price;
    private String ImageURL;
    private int TypeID;
    private int Sale;
    private int Status;

    public Product() {
    }

    public Product(int ProductID, String Name, String Description, int Price, String ImageURL, int TypeID, int Sale, int Status) {
        this.ProductID = ProductID;
        this.Name = Name;
        this.Description = Description;
        this.Price = Price;
        this.ImageURL = ImageURL;
        this.TypeID = TypeID;
        this.Sale = Sale;
        this.Status = Status;
    }

 

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String ImageURL) {
        this.ImageURL = ImageURL;
    }

    public int getTypeID() {
        return TypeID;
    }

    public void setTypeID(int TypeID) {
        this.TypeID = TypeID;
    }

    public int getSale() {
        return Sale;
    }

    public void setSale(int Sale) {
        this.Sale = Sale;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Product{" + "ProductID=" + ProductID + ", Name=" + Name + ", Description=" + Description + ", Price=" + Price + ", ImageURL=" + ImageURL + ", TypeID=" + TypeID + ", Sale=" + Sale + ", Status=" + Status + '}';
    }
    

    
}
