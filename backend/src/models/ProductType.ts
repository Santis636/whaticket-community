import { AllowNull, AutoIncrement, Column, CreatedAt, DataType, Default, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Company from "./Company";

@Table({
    indexes: [{
        unique: true,
        fields: ["companyId", "name"]
    }]
})
class ProductType extends Model<ProductType> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @AllowNull(false)
    @Column
    name: string;

    //valor de venda
    @AllowNull(false)
    @Default(0)
    @Column(DataType.FLOAT)
    saleValue: number;

    //valor do aluguel
    @AllowNull(false)
    @Default(0)
    @Column(DataType.FLOAT)
    rentValue: number;

    @Default(true)
    @Column
    active: boolean;

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
export default ProductType