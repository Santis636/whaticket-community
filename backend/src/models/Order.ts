import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, DataType, Default, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import User from "./User";
import Company from "./Company";
import Contact from "./Contact";
import OperationType from "./OperationType";
import Coupon from "./Coupon";

@Table
class Order extends Model<Order> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @ForeignKey(() => Contact)
    @AllowNull(false)
    @Column
    contactId: number;  //cliente externo solicitante

    @BelongsTo(() => Contact)
    contact: Contact

    @Column
    orderStatus: string; // aberto | finalizado | cancelado

    @Column(DataType.FLOAT)
    totalValue: number;

    @Column(DataType.TEXT)
    finalAttachment: string;

    @ForeignKey(() => User)
    @AllowNull(false)
    @Column
    sellerId: number;

    @BelongsTo(() => User)
    user: User; 

    @Column
    paymentType: string; //cartão | dinheiro | etc

    @Column(DataType.DATE)
    deliveryDate: Date;

    @ForeignKey(() => Coupon)
    @AllowNull(false)
    @Column
    couponId: number;

    @BelongsTo(() => Coupon)
    coupon: Coupon

    @ForeignKey(() => OperationType)
    @AllowNull(false)
    @Column
    operationTypeId: number; // venda | aluguel

    @BelongsTo(() => OperationType)
    operationType: OperationType

    @Column(DataType.DATE)
    requestDate: Date;

    @Column(DataType.DATE)
    rentalStartDate: Date;

    @Column(DataType.DATE)
    rentalExpectedReturnDate: Date;

    @Column(DataType.DATE)
    rentalEndDate: Date;

    @Default(true)
    @Column
    active: boolean;

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
export default Order;