import * as Swagger from '@nestjs/swagger';
import { Expose } from 'class-transformer';
import { IsString, IsNotEmpty, IsUUID } from 'class-validator';
import { Create{{name.pascalCase()}}Command, Update{{name.pascalCase()}}Command } from '../../usecases/{{name.paramCase()}}';

export class Create{{name.pascalCase()}}Request implements Create{{name.pascalCase()}}Command {
  @Swagger.ApiProperty({ type: 'string', format: 'uuid' })
  @IsUUID()
  id: string;

  @Swagger.ApiProperty({ type: 'string' })
  @IsString()
  @IsNotEmpty()
  name: string;
}

export class Update{{name.pascalCase()}}Request implements Omit<Update{{name.pascalCase()}}Command, 'id'> {
  @Swagger.ApiProperty({ type: 'string' })
  @IsString()
  @IsNotEmpty()
  name: string;
}

export class {{name.pascalCase()}}Response {
  @Swagger.ApiProperty({ type: 'string', format: 'uuid' })
  @Expose({ groups: ['read'] })
  id: string;

  constructor(partial: Partial<{{name.pascalCase()}}Response>) {
    Object.assign(this, partial);
  }
}
