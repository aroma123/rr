%%   Copyright 2013 Aroma Mahendru
%%
%%   you may not use this file except in compliance with the License.
%%   You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%%   Unless required by applicable law or agreed to in writing, software
%%   distributed under the License is distributed on an "AS IS" BASIS,
%%   See the License for the specific language governing permissions and
%%   limitations under the License.

function [i a] = majorlabels(i,N, param2)
[m n]=size(i);
x=zeros(N,1);
for I=1:N
    for j=1:m 
        for k=1:n
           if (i(j,k)==I)
               x(I)=x(I)+1;
           end
                  
            
        end
        
    end
   
end
  a=zeros(N,1);
  for I=1:N
      if (x(I)>param2)
          a(I)=1;
      end
     
  end
   for j=1:m 
        for k=1:n
           if(i(j,k)~=0)
           i(j,k)=i(j,k)* a(i(j,k));      
           end 
        end
        
   end
   
  imshow(label2rgb(i,@jet, [0.7 0.7 0.7]));
end
