import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Product from "./Product";
import StockMovementType from "./StockMovementType";
import Order from "./Order";
import Company from "./Company";

@Table
class StockMovement extends Model<StockMovement> {
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
    @AllowNull(true)
    @Column
    orderId: number;

    @BelongsTo(() => Order)
    order: Order;

    @ForeignKey(() => StockMovementType)
    @AllowNull(false)
    @Column
    movementTypeId: number;

    @BelongsTo(() => StockMovementType)
    stockMovementType: StockMovementType;

    @ForeignKey(() => Company)
    @AllowNull(false)
    @Column
    companyId: number;

    @BelongsTo(() => Company)
    company: Company;

    @Column
    quantity: number;

    @AllowNull(false)
    @Column
    createdBy: string;

    @AllowNull(false)
    @CreatedAt
    createdAt: Date;

    @Column
    updatedBy: string;

    @UpdatedAt
    updatedAt: Date;

}
export default StockMovement;