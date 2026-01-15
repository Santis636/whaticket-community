import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, Default, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Company from "./Company";

@Table({
    indexes: [{
        unique: true,
        fields: ["companyId", "name"]
    }]
})
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
    @AllowNull(false)
    @Column
    companyId: number;

    @BelongsTo(() => Company)
    company: Company;

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
export default Role;