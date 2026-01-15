import { AllowNull, AutoIncrement, Column, CreatedAt, Default, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";

@Table
class OperationType extends Model<OperationType> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @Column
    name: string; //venda |aluguel

    @Default(true)
    @Column
    active: boolean;

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
export default OperationType;