/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author buiqu
 */
public class Categorize {
    private int TypeID;
    private String NameType;

    public Categorize() {
    }

    public Categorize(int TypeID, String NameType) {
        this.TypeID = TypeID;
        this.NameType = NameType;
    }

    public int getTypeID() {
        return TypeID;
    }

    public void setTypeID(int TypeID) {
        this.TypeID = TypeID;
    }

    public String getNameType() {
        return NameType;
    }

    public void setNameType(String NameType) {
        this.NameType = NameType;
    }

    @Override
    public String toString() {
        return "Categorize{" + "TypeID=" + TypeID + ", NameType=" + NameType + '}';
    }
    
    
}
