import { AutoIncrement, Column, CreatedAt, Default, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";

@Table
class License extends Model<License> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @Column
    type: string; // basic, pro, enterprise

    @Column
    startDate: Date;

    @Column
    endDate: Date;

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
export default License