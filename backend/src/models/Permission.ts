import { AllowNull, AutoIncrement, Column, CreatedAt, Default, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";

@Table
class Permission extends Model<Permission> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @Column
    name: string;

    @Column
    description: string; // ticket.create

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
}
export default Permission;