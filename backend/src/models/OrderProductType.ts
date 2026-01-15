import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, DataType, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Order from "./Order";
import ProductType from "./ProductType";
import Company from "./Company";

@Table
class OrderProductType extends Model<OrderProductType> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number

    @ForeignKey(() => Order)
    @AllowNull(false)
    @Column
    orderId: number;

    @BelongsTo(() => Order)
    order: Order;

    @ForeignKey(() => ProductType)
    @AllowNull(false)
    @Column
    productTypeId: number;

    @BelongsTo(() => ProductType)
    productType: ProductType;

    @Column
    quantity: number;

    @Column(DataType.FLOAT)
    value: number;

    @ForeignKey(() => Company)
    @AllowNull(false)
    @Column
    companyId: number;

    @AllowNull(false)
    @CreatedAt
    createdAt: Date;

    @AllowNull(false)
    @Column
    createdBy: string;

    @UpdatedAt
    updatedAt: Date;

    @Column
    updatedBy: string;

}
export default OrderProductType;