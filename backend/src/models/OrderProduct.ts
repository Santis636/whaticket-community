import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Product from "./Product";
import OrderProductType from "./OrderProductType";
import Order from "./Order";
import { orderBy } from "lodash";
import Company from "./Company";

@Table
class OrderProduct extends Model<OrderProduct> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @ForeignKey(() => Product)
    @AllowNull(false)
    @Column
    productId: number;

    @BelongsTo(() => Product)
    product: Product;

    @ForeignKey(() => Order)
    @AllowNull(false)
    @Column
    orderId: number;

    @BelongsTo(() => Order)
    order: Order;

    @ForeignKey(() => OrderProductType)
    @AllowNull(false)
    @Column
    orderProductTypeId: number;

    @BelongsTo(() => OrderProductType)
    orderProductType: OrderProductType;

    @Column
    status: string; //reservado | entregue | devolvido | vendido

    @ForeignKey(() => Company)
    @AllowNull(false)
    @Column
    companyId: number;

    @BelongsTo(() => Company)
    company: Company;

    @CreatedAt
    createdAt: Date;

    @AllowNull(false)
    @Column
    createdBy: string;

    @UpdatedAt
    updatedAt: Date;

    @AllowNull(false)
    @Column
    updatedBy: string;
}
export default OrderProduct;