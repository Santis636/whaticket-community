import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, Default, ForeignKey, HasMany, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
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
    address: string;

    @Column
    logo: string;

    @Default(true)
    @Column
    active: boolean;


    @AllowNull(false)
    @Column
    createdBy: string;

    @CreatedAt
    createdAt: Date;

    @AllowNull(false)
    @Column
    updatedBy: string;

    @UpdatedAt
    updatedAt: Date;

    @HasMany(() => License)
    licenses: License[];

}
export default Company;