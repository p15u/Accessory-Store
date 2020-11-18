
package model;

import java.io.Serializable;

public enum Role implements Serializable
{
    ADMIN, EMPLOYEE, CUSTOMER;
    
    public static Role get(int role) {
        return Role.values()[role];
    }
    
    public boolean isAdmin() {
        return this == ADMIN;
    }
    
    public boolean isEmppoyee() {
        return this == EMPLOYEE;
    }
    
    public boolean isCustomer() {
        return this == CUSTOMER;
    }
    
    public int get() {
        switch (this) {
            case ADMIN:     return 0;
            case EMPLOYEE:  return 1;
            case CUSTOMER:  return 2;
            default:        return -1;
        }
    }
    
    public String getName() {
        switch (this) {
            case ADMIN:     return "Admin";
            case EMPLOYEE:  return "Employee";
            case CUSTOMER:  return "Customer";
            default:        return "";
        }
    }
    
    @Override
    public String toString() {
        return getName();
    }
}
