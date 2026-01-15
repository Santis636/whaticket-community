import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, Default, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import License from "./License";

@Table
class Company extends Model<Company> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @AllowNull(false)
    @Column
    name: string;

    @AllowNull(false)
    @Column
    document: string;

    @Column
    adress: string;

    @Column
    logo: string;

    @Default(true)
    @Column
    active: boolean;

    @ForeignKey(() => License)
    @Column
    licenseId: number;

    @BelongsTo(() => License)
    license: License;

    @Column
    createdBy: string;

    @CreatedAt
    createdAt: Date;

    @Column
    updatedBy: string;

    @UpdatedAt
    updatedAt: Date;
}
export default Company;