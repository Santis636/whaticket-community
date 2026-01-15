import { AutoIncrement, BelongsTo, Column, CreatedAt, Default, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Company from "./Company";

@Table
class Role extends Model<Role> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @Column
    name: string;//admin, atendente

    @Default(true)
    @Column
    active: boolean;

    @ForeignKey(() => Company)
    @Column
    companyId: number;

    @BelongsTo(() => Company)
    company: Company;

    @Column
    createdBy: string;

    @CreatedAt
    createdAt: Date;

    @Column
    updatedBy: string;

    @UpdatedAt
    updatedAt: Date;
}
export default Role;