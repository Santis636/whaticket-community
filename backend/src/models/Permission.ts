import { AutoIncrement, Column, CreatedAt, Default, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";

@Table
class Permission extends Model<Permission> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @Column
    name: string;

    @Column
    decription: string; // ticket.create

    @Default(true)
    @Column
    active: boolean;

    @Column
    createdBy: string;

    @CreatedAt
    createdAt: Date;

    @Column
    updatedBy: string;

    @UpdatedAt
    updatedAt: Date;
}
export default Permission;