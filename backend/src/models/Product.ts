import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, DataType, Default, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import ProductType from "./ProductType";
import Company from "./Company";

@Table
class Product extends Model<Product> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @AllowNull(false)
    @Column
    name: string;

    @Column(DataType.TEXT)
    description: string;

    @AllowNull(false)
    @Column
    identification: string;

    @AllowNull(false)
    @Column
    status: string; // disponivel | alugado | vendido | manutenção

    @ForeignKey(() => ProductType)
    @AllowNull(false)
    @Column
    productTypeId: number;

    @BelongsTo(() => ProductType)
    productType: ProductType

    @ForeignKey(() => Company)
    @AllowNull(false)
    @Column
    companyId: number;

    @BelongsTo(() => Company)
    company: Company

    @Default(true)
    @Column
    active: boolean;

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
export default Product